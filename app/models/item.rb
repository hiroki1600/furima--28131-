class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, presence: true
  validates :name, length: {maximum: 40 }
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shopping_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :scheduled_delivery_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates_inclusion_of :price, in: 300..9_999_999
  validates :image, presence: true

  has_one_attached :image

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery


end