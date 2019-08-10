require 'rails_helper'

describe Product do
  it("has many reviews") do
    product = Product.create(name: "product")
    review1 = Review.create(user_name: "guy", product_id: product.id)
    review2 = Review.create(user_name: "guy2", product_id: product.id)
    expect(product.reviews()).to(eq([review1, review2]))
  end

  it { should validate_presence_of :name }
  it { should have_many(:reviews) }

  it("titleizes the name of an product") do
    product = Product.create({name: "giant steps", company: "jazz"})
    expect(product.name()).to(eq("Giant Steps"))
  end
end
