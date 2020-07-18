class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :name, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_payer_id, presence: true
  validates :prefecture_id, presence: true
  validates :preparation_day_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, 
                                    less_than_or_equal_to: 9999999,
                                    only_integer: true }
  validates :image,presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition

  validates :category, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id

  end
end
