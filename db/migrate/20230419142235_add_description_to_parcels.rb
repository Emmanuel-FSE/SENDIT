class AddDescriptionToParcels < ActiveRecord::Migration[7.0]
  def change
    add_column :parcels, :description, :string
  end
end
