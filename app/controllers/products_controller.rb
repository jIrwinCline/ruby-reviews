class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end
  def new
    @product = Product.new
    render :new
  end
  def create #how to make product_params method private?
    def product_params
      params.require(:product).permit(:name, :company, :purpose)
    end
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end

  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end
  def update

    def product_params
      params.require(:product).permit(:name, :company, :purpose)
    end
    
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
end