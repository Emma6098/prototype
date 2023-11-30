class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @review.user = current_user
    if @review.save
    redirect_to user_path(@user)
    else
      render 'users/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(@review.user), status: see_other
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
