class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchses

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "full-width characters." }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "full-width characters." }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "full-width katakana characters."}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "full-width katakana characters." }
    validates :birthday
  end
  validates :password, format: { with: PASSWORD_REGEX, message: "Include both letters and numbers" }
  validates :email, uniqueness: true
end
