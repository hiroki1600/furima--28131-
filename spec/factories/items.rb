FactoryBot.define do
  factory :item do
      name                     { Faker::Name.initials(number: 2)}
      text                     { "テスト" }
      category_id              { 2 }
      status_id                { 2 }
      shopping_fee_id          { 2 }
      prefecture_id            { 2 }
      scheduled_delivery_id    { 2 }
      price                    { 11111 }
      association :user

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/camera.jpg'), filename: 'camera.jpg')
      end
  end
end