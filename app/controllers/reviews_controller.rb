class ReviewsController < ApplicationController
    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)

        if @review.save 
            redirect_to @product , notice: 'Review has been added'
        else 
            redirect_to @product , notice: 'Review was not added'
        end 
    end
    def destroy
        @delete_review = Review.find(params[:id]).destroy
        flash[:success] = "Review deleted"
        redirect_to :back
    end
    private
    def review_params
        params.require(:review).permit(:description, :rating).merge(user: current_user)
    end
end