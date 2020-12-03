FactoryBot.define do
  factory :item do
      name                     { Faker::Name.initials(number: 2)}
      text                     { hoge12}
      category_id              { Category.data[2]}
      status_id                { Status.data[2]}
      shopping_fee_id          { Shopping_fee.data[2] }
      prefecture_id            { Prefecture.data[2] }
      scheduled_delivery_id    { Scheduled_delivery.data[2] }
      price                    { Gimei.last.katakana }
  end
end
