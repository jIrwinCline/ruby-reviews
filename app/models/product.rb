class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # validates :name, presence: true
  # validates :company, presence: true
  # validates :purpose, presence: true
  # validates :cost, presence: true
  # validates :country_of_origin, presence: true
  before_save(:titleize_product)
  before_save(:country_caps)

  # scope :most_reviews, -> { Product.maximum(:reviews) }#??

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

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :usa_only, -> { where(country_of_origin: "USA") | where(country_of_origin: "United States Of America")}

  private

    def country_caps
      if country_of_origin == "usa"
        self.country_of_origin = self.country_of_origin.upcase
      else
        self.country_of_origin = self.country_of_origin.titleize
      end
    end
    def titleize_product
      self.name = self.name.titleize
    end
end
