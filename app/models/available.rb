class Available < ApplicationRecord
  # Direct associations

  belongs_to :foods
  belongs_to :user
  # Indirect associations

  # Validations
validates :quantity, :presence => true
validates :foods_id, :presence => true
validates :user_id, :presence => true
validates :storage_area, :presence => true
validates :size, :presence => true


end
