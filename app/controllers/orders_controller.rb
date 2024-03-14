class OrdersController < ApplicationController
  before_action :set_article, only: [:create, :show, :edit, :update, :destroy]

  def create
    @order = Order.new
    @order.article = @article
    @order.user = current_user
    @seller = @article.user
    if params[:buy_now]
      @order.status = "validée"
    else
      # Si l'utilisateur fait une offre
      @order.status = "en attente de validation"
      @order.offer_price = order_params[:offer_price]
    end
    @order.save!
    redirect_to control_path(@order)
  end

  def destroy
    @order_delete = Order.find(params[:id])
    @order_delete.destroy
    redirect_to control_path, notice: 'Order was successfully destroyed.', status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def order_params
    params.require(:order).permit(:offer_price, :order_id)
  end

end
