FactoryBot.define do
  factory :item do
    product { Faker::Lorem.sentence[1..40] }
    explanation { Faker::Lorem.sentence[1..10_000] }
    category_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    area_id { 2 }
    day_id { 2 }
    price { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
