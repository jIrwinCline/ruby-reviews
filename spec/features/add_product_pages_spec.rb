require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Giant Steps'
    fill_in 'Genre', :with => 'Jazz'
    click_on 'Create Album'
    expect(page).to have_content 'Album successfully added!'
    expect(page).to have_content 'Giant Steps'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Album'
    expect(page).to have_content "Name can't be blank"
  end
end
