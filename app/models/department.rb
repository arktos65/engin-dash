# frozen_string_literal: true

class Department < ApplicationRecord
  # Model associations
  belongs_to :user
  has_many :members

  # Validators
  validates_presence_of :name, :user
end
