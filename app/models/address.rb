class Address < ApplicationRecord

with_option presence: true do
  validates :post_card, format:{ with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :city
  validates :Address
end

belongs_to :order

end
