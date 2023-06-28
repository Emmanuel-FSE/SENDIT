class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :company, null: true
      t.string :phone, null: true
      t.string :help
      t.string :about
      t.string :status

      t.timestamps
    end
  end
end
