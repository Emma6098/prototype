class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.datetime :date
      t.string :size
      t.string :brand
      t.string :state
      t.string :color
      t.string :categorie

      t.timestamps
    end
  end
end
