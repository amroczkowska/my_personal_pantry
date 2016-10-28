class Food < ApplicationRecord
  # Direct associations

  has_many   :foods_recipes,
             :foreign_key => "foods_id",
             :dependent => :destroy

  has_many   :pantries,
             :class_name => "Available",
             :foreign_key => "foods_id",
             :dependent => :destroy

  has_many   :similar_foods,
             :class_name => "Similar",
             :foreign_key => "foods_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
