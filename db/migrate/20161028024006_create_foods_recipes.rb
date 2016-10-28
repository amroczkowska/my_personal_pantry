class CreateFoodsRecipes < ActiveRecord::Migration
  def change
    create_table :foods_recipes do |t|
      t.integer :foods_id
      t.integer :recipes_id

      t.timestamps

    end
  end
end
