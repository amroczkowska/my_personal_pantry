class CreateSimilars < ActiveRecord::Migration
  def change
    create_table :similars do |t|
      t.string :similar_name
      t.integer :foods_id

      t.timestamps

    end
  end
end
