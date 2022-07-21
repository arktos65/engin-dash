# frozen_string_literal: true

class Member < ApplicationRecord
  # Associations
  belongs_to :role
  belongs_to :department
  belongs_to :source
  has_many :teams

  # Validators
  validates_presence_of :first_name, :last_name, :role, :department
  validates_presence_of :source

  # Returns the member's full name by concatenating the
  # first name and last name attributes.
  def full_name
    "#{first_name} #{last_name}"
  end
end
