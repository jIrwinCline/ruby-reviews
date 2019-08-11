class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :company, presence: true
  validates :purpose, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  before_save(:titleize_product)

  def self.most_reviews
    @top_count = 0
    @curr_count = 0
    @most_product = ''

    self.all.each do |product|
      product.reviews.each do |review|
        @curr_count += 1
      end
      if @curr_count > @top_count
        @top_count = @curr_count
        @most_product = product
      end
      @curr_count = 0
    end
    @most_product
  end

  private
    def titleize_product
      self.name = self.name.titleize
    end
end
