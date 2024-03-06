class OrdersController < ApplicationController
  before_action :set_article, only: [:create, :show, :edit, :update, :destroy]

  def create
    @order = Order.new
    @order.article = @article
    @order.user = current_user
    @order.status = "en attente de validation"
    @order.save!
    redirect_to control_path(@order)

  end

  def destroy
    @order_delete = Order.find(params[:id])
    @order_delete.destroy
    redirect_to control_path(@order.article), status: see_other
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

end
