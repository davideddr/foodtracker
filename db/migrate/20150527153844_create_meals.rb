class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.text :description
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
