class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])

    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully created!"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    flash[:notice] = "Review successfully edited!"
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_path(@review.product)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review successfully destroyed!"
    redirect_to product_path(@review.product)
  end

  private
    def review_params
      params.require(:review).permit(:user_name, :text, :rubies)
    end

end
