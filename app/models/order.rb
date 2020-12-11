class Order < ApplicationRecord
  attr_accessor :token

  validates :token, presence: true

  has_one :address
  belongs_to :user
  belongs_to :item

end
