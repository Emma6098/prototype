class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_article, only: [:create]

  def home
  end

  def create
    @order = Order.new
    @order.article = @article
    @order.user = current_user

    @order.offer_price = order_params[:offer_price]

    @order.save!
    redirect_to control_path(@order)
  end

  def accept
    @order_accept = Order.find(params[:order_id])

    @order_accept.update!(status: "validée")
    other_user = @order_accept.user

  end

  def reject
    @order_reject = Order.find(params[:order_id])
    @order_reject.update!(status: "rejetée")
    redirect_to control_path
  end

  def ended
    @article = Artcile.find(params[:id])
    @order = Order.where(article: @article, status: "validée")
    @order.update!(status: "terminée")
    redirect_to control_path
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def order_params
    params.require(:order).permit(:offer_price)
  end
end
