class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    belongs_to :item
    has_one :street_address


    validates :prefecture_id, numericality: { other_than: 1 } 
end
