class Recipe < ApplicationRecord
  # Direct associations

  has_many   :foods_recipes,
             :foreign_key => "recipes_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :foods,
             :through => :foods_recipes,
             :source => :foods

  # Validations
  belongs_to :user

end
