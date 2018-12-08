class ReviewsController < ApplicationController
before_filter :authorise

before_action :review, only: [:destroy]

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id]) # finding the parent model 
    @review.product = @product
    @review.user = current_user #setting the current_user as the review.user

    if @review.save
      redirect_to @product # redirecting to that product with the reviews
    else
      redirect_to '/'
    end
  end


  def destroy
    @product = Product.find(params[:product_id]) 
    @review = Review.find params[:id]
    @review.destroy
    redirect_to @product, notice: 'Review deleted!'
  end

  def review # purely solving a bug
  end


  def set_review
    @review = Review.find params[:id]
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
