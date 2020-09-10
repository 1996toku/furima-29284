class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shopping_chipping
  belongs_to_active_hash :area_of_delivary
  belongs_to_active_hash :days_until_shopping
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :status
    validates :shopping_chipping
    validates :area_of_delivary
    validates :days_until_shopping
    validates :user_id
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},format: { with: /\A[\d]\z/, message: 'half-width numbers' }
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :shopping_chipping_id, numericality: { other_than: 1 } 
  validates :area_of_delivary_id, numericality: { other_than: 1 } 
  validates :days_until_shopping_id, numericality: { other_than: 1 } 
end
