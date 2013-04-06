class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :id
      t.string :name
      t.date :added
      t.string :left
      t.string :perishibility
      t.string :category
      t.integer :kitchen_id

      t.timestamps
    end
  end
end
