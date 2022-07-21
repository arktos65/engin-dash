class Currency < ApplicationRecord
  # Associations
  has_many :teams

  # Validators
  validates_presence_of :name, :code, :exchange_rate
end
