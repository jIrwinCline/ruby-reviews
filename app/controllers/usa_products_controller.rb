class UsaProductsController < ApplicationController
  def index
    @products = Product.all.usa_only
    render :index
  end
end
