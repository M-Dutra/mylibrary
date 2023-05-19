class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50}
  validates :author, presence: true, length: { minimum: 3, maximum: 25}
  # Year between [1000,2050]
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1000, less_than_or_equal_to: 2050 }
  validates :rating, presence: true
  has_one_attached :photo
  belongs_to :user
end
