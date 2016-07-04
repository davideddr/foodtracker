class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.float :quantity, null: false
      t.string :units
      t.belongs_to :meal
      t.timestamps null: false
    end
  end
end
