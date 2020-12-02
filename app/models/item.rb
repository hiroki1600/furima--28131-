class Item < ApplicationRecord

  validates :name, presence: true, 
                   length: {maximum: 40 }
  validates :text, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :shpping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_delivery_id, presence: :true
  validates :price, presence: true,
                    format: { with: /\A[0-9]+\z/ }, 
                    numericality: { in: 300..9999999 }


  belongs_to :item

end
