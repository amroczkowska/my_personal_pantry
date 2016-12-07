class Food < ApplicationRecord
  # Direct associations

  has_many   :foods_recipes,
             :foreign_key => "foods_id",
             :dependent => :destroy

  has_many   :availables,
            :foreign_key => "foods_id",
             :dependent => :destroy
  # Indirect associations

  has_many   :recipes,
             :through => :foods_recipes,
             :source => :recipes

  # Validations

end
