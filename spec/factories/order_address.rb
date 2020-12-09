FactoryBot.define do
  factory :order_address do
    postal_code         { '123-4567' }
    prefecture_id       { 5 }
    city                { '大阪' }
    address             { '茨木市' }
    building_name       { '大池' }
    phone_number        { '09000000000'}
    user_id             { 1 }
    item_id             { 2 }
  end
end