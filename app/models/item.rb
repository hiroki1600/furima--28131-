class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name, length: {maximum: 40 }
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shopping_fee_id
    validates :scheduled_delivery_id
  end

  validates :prefecture_id, numericality: { other_than: 0 }
  validates_inclusion_of :price, in: 300..9_999_999

  has_many :favorites, dependent: :destroy

  has_one_attached :image
  has_one :order

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery


end