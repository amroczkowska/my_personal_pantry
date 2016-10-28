class CreateAvailablesSimilars < ActiveRecord::Migration
  def change
    create_table :availables_similars do |t|
      t.integer :similar_id
      t.integer :availables_id

      t.timestamps

    end
  end
end
