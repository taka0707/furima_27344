class SendingDestination < ApplicationRecord
  belongs_to :item, optional: true
  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :item_id
  end

  VALID_POST_CODE = /\A\d{3}[-]\d{4}\z/.freeze
  VALID_PHONE_NUMBER = /\A[0-9]+\z/.freeze

  validates :post_code, format: { with: VALID_POST_CODE }
  validates :phone_number, length: { maximum: 11 }, format: { with: VALID_PHONE_NUMBER }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :prefecture_id, numericality: { other_than: 1, message: '%{model} Select' }
end
