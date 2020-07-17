FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    password              {"aaa000"}
    password_confirmation {"aaa000"}
    sequence(:email) {Faker::Internet.email}
    family_name           {"あ亜ア"}
    first_name            {"あ亜ア"}
    family_name_kana      {"アベ"}
    first_name_kana       {"アベ"}
    birth_date            {"1900-10-10"}
  end

end