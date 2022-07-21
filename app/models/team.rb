# frozen_string_literal: true

class Team < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :project
  belongs_to :currency

  # Validators
  validates_presence_of :annual_rate, :member, :project, :currency
end
