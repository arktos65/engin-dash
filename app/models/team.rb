# frozen_string_literal: true

class Team < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :project
  belongs_to :currency

  # Validators
  validates_presence_of :annual_rate, :member, :project, :currency
  validate :validate_allocation_lt_zero, :validate_allocation_gt_100
  validates :allocation, numericality: { only_integer: true }

  # Perform additional operations before saving record
  before_save :calculate_weekly

  # Custom validator methods
  def validate_allocation_lt_zero
    if allocation < 0
      errors.add(:allocation, "value can't be less than 0")
    end
  end

  def validate_allocation_gt_100
    if allocation > 100
      errors.add(:allocation, "value can't be greather than 100")
    end
  end

  # Called when record is being save
  # Calculate the weekly rate from annual rate
  def calculate_weekly
    self.weekly_rate = self.annual_rate / 52
  end
end
