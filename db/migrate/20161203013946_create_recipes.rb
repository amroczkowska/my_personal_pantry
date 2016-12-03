class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :url
      t.string :ingrediants
      t.integer :image
      t.string :type
      t.string :ease
      t.integer :user_id

      t.timestamps

    end
  end
end
