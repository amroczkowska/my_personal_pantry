class Similar < ApplicationRecord
  # Direct associations

  has_many   :similar_foods_availables,
             :class_name => "AvailablesSimilar",
             :dependent => :destroy

  belongs_to :foods

  # Indirect associations

  has_many   :availables,
             :through => :similar_foods_availables,
             :source => :availables

  # Validations

end
