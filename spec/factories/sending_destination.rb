FactoryBot.define do
  factory :SendingDestination do
    post_code         { '000-0000' }
    prefecture_id  { '2' }
    city { 'abcd' }
    house_number { 'abcd' }
    building_name { 'abcd' }
    phone_number { '09012345678' }
    item
  end
end