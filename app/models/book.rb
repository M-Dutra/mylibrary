class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 25}
  validates :author, presence: true, length: { minimum: 3, maximum: 25}
  # Year between [1000,2050]
  VALID_YEAR_REGEX = ^(?:10[0-9]{2}|1[1-9][0-9]{2}|20[0-4][0-9]|2050)$
  validates :year, presence: true, format: { with: VALID_YEAR_REGEX}
end
