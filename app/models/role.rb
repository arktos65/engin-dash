# frozen_string_literal: true

class Role < ApplicationRecord
  # Associations
  belongs_to :department
  has_many :members

  # Validators
  validates_presence_of :name, :department
end
