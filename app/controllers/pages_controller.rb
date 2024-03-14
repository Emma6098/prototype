class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_article, only: [:create]

  def home
  end

  def control2
    @articles = Article.all # Ou toute autre logique pour récupérer les articles
    @sellers = User.where(id: @articles.pluck(:user_id)) # Récupérer tous les vendeurs des articles
  end

  def create
    @order = Order.new(order_params)
    @order.article = @article
    @order.user = current_user
    @order = Order.find(params[:id])
    @seller = @article.user
    if params[:buy_now]
      @order.status = "validée"
    else
      # Si l'utilisateur fait une offre
      @order.status = "en attente de validation"
      @order.offer_price = order_params[:offer_price]
    end
    @order.save!
    redirect_to control_path
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
    params.require(:order).permit(:offer_price, :order_id)
  end
end
