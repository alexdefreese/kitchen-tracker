class CreateKitchensUsersTable < ActiveRecord::Migration
  def up
    create_table :kitchens_users, id: false do |t|
      t.integer :kitchen_id
      t.integer :user_id
    end
    add_index(:kitchens_users, [:kitchen_id, :user_id], :unique => true)
  end

  def down
    drop_table :kitchens_users
  end
end
