class CreateAvailables < ActiveRecord::Migration
  def change
    create_table :availables do |t|
      t.integer :foods_id
      t.integer :quantity
      t.date :purchase_date
      t.string :expiration_date
      t.boolean :perishable_ind
      t.string :storage_area
      t.string :type

      t.timestamps

    end
  end
end
