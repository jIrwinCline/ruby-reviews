require 'rails_helper'

describe Product do
  it("has many reviews") do
    product = Product.create(name: "product")
    review1 = Review.create(user_name: "guy", product_id: product.id)
    review2 = Review.create(user_name: "guy2", product_id: product.id)
    expect(product.reviews()).to(eq([review1, review2]))
  end
end
