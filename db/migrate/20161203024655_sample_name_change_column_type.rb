class SampleNameChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column(:recipes, :ingrediants, :array)
  end
end
