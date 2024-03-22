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

  def accept
    @order_accept = Order.find(params[:order_id])

    if @order_accept.status == "en attente de validation"
      @order_accept.update!(status: "validée", accepted_offer_price: @order_accept.offer_price)

    elsif @order_accept.status == "contre-offre"
      @order_accept.update!(status: "validée", accepted_offer_price: @order_accept.counter_offer_price)

    end

    redirect_to control_path
  end

  def reject
    @order_reject = Order.find(params[:order_id])
    @order_reject.update!(status: "rejetée")
    redirect_to control_path
  end

  def submit_counter_offer
    @order_counter_offer = Order.find(params[:order_id])
    @order_counter_offer.update!(status: "contre-offre", counter_offer_price: params[:counter_offer_price])
    @order_counter_offer.counter_offer_price = order_params[:counter_offer_price]

    @order.save!
    redirect_to control_path
  end

  def ended
    @article = Article.find(params[:id])
    @order = Order.where(article: @article, status: "validée")
    @order.update!(status: "terminée")
    redirect_to control_path
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def order_params
    params.require(:order).permit(:offer_price, :order_id, :counter_offer_price, :accepted_offer_price)
  end

end
