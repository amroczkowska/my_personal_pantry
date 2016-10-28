class Recipe < ApplicationRecord
  # Direct associations

  has_many   :foods_recipes,
             :foreign_key => "recipes_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
