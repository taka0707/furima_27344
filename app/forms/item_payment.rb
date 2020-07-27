class ItemPayment
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :post_code, :prefecture_id,
                :city, :house_number, :building_name, :phone_number, :item_id

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

  validates :prefecture_id, numericality: { other_than: 1, message: '%{model} Select' }

  def save
    SendingDestination.create!(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                              building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end
