class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id]) # finding the parent model 
    @review.product = @product
    @review.user = current_user

    if @review.save
      redirect_to @product # redirecting to that product with the reviews
    else
      redirect_to '/'
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
