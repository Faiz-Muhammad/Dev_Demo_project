class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :p_name
      t.string :p_description
      t.string :p_price
      t.belongs_to :user, index: true, foreign_key: true 
      t.timestamps
    end
  end
end
