require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Add a new product for Review'
    fill_in 'Name', :with => 'Product'
    fill_in 'Company', :with => 'Company'
    fill_in 'Purpose', :with => 'This product has a purpose'
    fill_in 'Cost', :with => '11.98'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Product'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end
