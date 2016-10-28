class AvailablesSimilar < ApplicationRecord
  # Direct associations

  belongs_to :similar_foods,
             :class_name => "Similar",
             :foreign_key => "similar_id"

  belongs_to :availables

  # Indirect associations

  # Validations

end
