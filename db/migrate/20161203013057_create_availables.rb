class CreateAvailables < ActiveRecord::Migration
  def change
    create_table :availables do |t|
      t.integer :foods_id
      t.integer :quantity
      t.date :expiration_date
      t.string :storage_area
      t.string :size
      t.integer :user_id

      t.timestamps

    end
  end
end
