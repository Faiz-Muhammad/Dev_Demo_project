class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :c_description
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :product, index: true, foreign_key: true
    end
  end
end
