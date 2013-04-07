class AddPrimaryKitchenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :primary_kitchen_id, :integer
  end
end
