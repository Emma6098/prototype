class Review < ApplicationRecord
  belongs_to :user
  validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
  validates :comment, presence: true, length: { maximum: 1000 }
end
