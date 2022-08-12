# frozen_string_literal: true

class Team < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :project
  belongs_to :currency

  # Validators
  validates_presence_of :annual_rate, :member, :project, :currency
  validates :allocation, numericality: { only_integer: true }
  validates :allocation, numericality: { greater_than: 0 }
  validates :allocation, numericality: { less_than_or_equal_to: 100 }

  # Perform additional operations before saving record
  before_save :calculate_weekly

  # Called when record is being save
  # Calculate the weekly rate from annual rate
  def calculate_weekly
    self.weekly_rate = self.annual_rate / 52
  end
end
