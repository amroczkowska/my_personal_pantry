class Available < ApplicationRecord
  # Direct associations

  has_many   :similar_foods_availables,
             :class_name => "AvailablesSimilar",
             :foreign_key => "availables_id",
             :dependent => :destroy

  belongs_to :foods

  # Indirect associations

  has_many   :similar_foods,
             :through => :similar_foods_availables,
             :source => :similar_foods

  # Validations

end
