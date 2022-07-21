# frozen_string_literal: true

class Stream < ApplicationRecord
  # Associations
  has_many :projects

  # Validators
  validates_presence_of :name
end
