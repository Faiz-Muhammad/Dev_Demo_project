class DropProductsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :products_tables
  end
end
