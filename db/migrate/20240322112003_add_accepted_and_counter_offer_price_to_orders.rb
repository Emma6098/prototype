class AddAcceptedAndCounterOfferPriceToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :accepted_offer_price, :decimal
    add_column :orders, :counter_offer_price, :decimal
  end
end
