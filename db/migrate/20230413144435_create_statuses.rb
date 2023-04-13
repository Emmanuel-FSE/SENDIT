class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.references :parcel, null: false, foreign_key: true
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
