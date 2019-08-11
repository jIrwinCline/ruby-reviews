class Review < ApplicationRecord
  validates :rubies, length: { in: 1..5 }
  validates :user_name, presence: true
  validates :text, length: { in: 50..250 }
  belongs_to :product
end
