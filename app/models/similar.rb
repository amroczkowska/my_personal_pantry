class Similar < ApplicationRecord
  # Direct associations

  has_many   :similar_foods_availables,
             :class_name => "AvailablesSimilar",
             :dependent => :destroy

  belongs_to :foods

  # Indirect associations

  # Validations

end
