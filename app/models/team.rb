class Team < ApplicationRecord
  belongs_to :member
  belongs_to :project
  belongs_to :currency
end
