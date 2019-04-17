class CreateProductsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :products_tables do |t|
      t.string :p_name
      t.string :p_description
      t.string :p_price
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
