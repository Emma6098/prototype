class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @review = Review.new(user: @user)
    @reviews = @user.reviews

    total_rating = @reviews.sum(&:rating)
    @average_rating = (total_rating.to_f / @reviews.count).round(1) unless @reviews.empty?
  end

end
