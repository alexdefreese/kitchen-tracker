class CreateKitchens < ActiveRecord::Migration
  def change
    create_table :kitchens do |t|
      t.integer :id
      t.string :name
      t.string :auth_code

      t.timestamps
    end
  end
end
