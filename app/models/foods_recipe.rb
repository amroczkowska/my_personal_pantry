class FoodsRecipe < ApplicationRecord
  # Direct associations

  belongs_to :recipes

  belongs_to :foods

  # Indirect associations

  # Validations

end
