class Article < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :size, presence: true
  validates :brand, presence: true
  validates :state, presence: true
  validates :color, presence: true
  validates :categorie, presence: true
end
