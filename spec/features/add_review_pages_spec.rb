require 'rails_helper'

describe "the add a review process" do
  before :each do
      visit products_path
      click_link 'Add a new product for Review'
      fill_in 'Name', :with => 'Ford Truck'
      fill_in 'Company', :with => 'Company'
      fill_in 'Purpose', :with => 'This product has a purpose'
      fill_in 'Cost', :with => '11.98'
      fill_in 'Country of origin', :with => 'USA'
      click_on 'Create Product'
      click_on 'Ford Truck'
  end
  it "adds a new review" do
    # visit product_reviews_path
    click_link 'Review this Product'
    fill_in 'User name', :with => 'TheGuy'
    fill_in 'Text', :with => 'this was a good product.this was a good product.this was a good product.this was a good product.'
    fill_in 'Rubies', :with => '3'
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully created!'
    expect(page).to have_content 'TheGuy'
  end

  it "gives an error when no values are entered" do
    # visit new_review_path
    click_on 'Review this Product'
    click_on 'Create Review'
    expect(page).to have_content "Rubies is too short (minimum is 1 character)"
    expect(page).to have_content "User name can't be blank"
    expect(page).to have_content "Text is too short (minimum is 50 characters)"
  end

  it "Edits a review" do
    # visit reviews_path
    click_link 'Review this Product'
    fill_in 'User name', :with => 'TheGuy'
    fill_in 'Text', :with => 'this was a good product.this was a good product.this was a good product.this was a good product.'
    fill_in 'Rubies', :with => '3'
    click_on 'Create Review'
    click_link 'TheGuy'
    click_link 'Edit Review'
    fill_in 'User name', :with => 'TheRealGuy'
    click_on 'Update Review'
    expect(page).to have_content 'TheRealGuy'
  end
end
