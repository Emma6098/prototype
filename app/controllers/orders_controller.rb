class OrdersController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def create
    @order = Order.new(order_params)
    @order.article = @article
    @order.user = current_user
    @order.save!
    redirect_to article_path(@order.article)
  end

  def destroy
    @order_delete = Order.find(params[:id])
    @order_delete.destroy
    redirect_to article_path(@order.article), status: see_other
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

end
