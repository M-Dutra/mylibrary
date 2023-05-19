class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50}
  validates :author, presence: true, length: { minimum: 3, maximum: 25}
  # Year between [1000,2050]
  VALID_YEAR_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :year, presence: true, format: { with: VALID_YEAR_REGEX}
  validates :rating, presence: true
  has_one_attached :photo
  belongs_to :user
end
