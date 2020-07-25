FactoryBot.define do
  factory :item do
    name         { 'title' }
    introduction { Faker::Lorem.sentence }
    category_id  { '2' }
    condition_id { '2' }
    postage_payer_id { '2' }
    prefecture_id { '2' }
    preparation_day_id { '2' }
    price { '2000' }
    user

    after(:build) do |item|
      item.image = { io: File.open("#{Rails.root}/public/images/test_image.jpg"), filename: 'test_image.jpg' }
    end

    after(:create) do |item|
      item.image = { io: File.open("#{Rails.root}/public/images/test_image.jpg"), filename: 'test_image.jpg' }
    end
  end
end
