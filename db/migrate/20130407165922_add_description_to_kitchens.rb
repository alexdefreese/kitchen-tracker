class AddDescriptionToKitchens < ActiveRecord::Migration
  def change
    add_column :kitchens, :description, :text
  end
end
