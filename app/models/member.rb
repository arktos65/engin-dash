class Member < ApplicationRecord
  belongs_to :role
  belongs_to :department
  belongs_to :source
end
