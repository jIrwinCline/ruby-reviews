class Review < ApplicationRecord
  validates :rubies, length: { in: 1..5 }
  validates :user_name, presence: true
  validates :text, length: { minimum: 5 }
  belongs_to :product
end
