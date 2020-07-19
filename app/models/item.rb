class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :sending_destination
  with_options presence: true do
    validates :name
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :preparation_day_id
    validates :image
  end
  validates :price, numericality: { greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999,
                                    only_integer: true }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  with_options numericality: { other_than: 1, message: '%{model} Select' } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :preparation_day_id
  end
end
