class CreateParcels < ActiveRecord::Migration[7.0]
  def change
    create_table :parcels do |t|
      t.references :user, null: false, foreign_key: true
      t.string :parcel_name
      t.string :pickup_location
      t.string :destination
      t.integer :weight
      t.integer :price

      t.timestamps
    end
  end
end
