class Plant < ApplicationRecord
  validates :name, presence: true
  validates :type_of, presence: true
  validates :location, presence: true
end
