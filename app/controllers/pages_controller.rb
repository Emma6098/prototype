class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
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
end
