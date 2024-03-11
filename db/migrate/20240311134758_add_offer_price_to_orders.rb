class AddOfferPriceToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :offer_price, :decimal
  end
end
