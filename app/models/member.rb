class Member < ApplicationRecord
  belongs_to :role
  belongs_to :department
  belongs_to :source

  # Returns the member's full name by concatenating the
  # first name and last name attributes.
  def full_name
    return self.first_name + " " + self.last_name
  end
end
