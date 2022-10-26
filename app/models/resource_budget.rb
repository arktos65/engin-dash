# frozen_string_literal: true

class ResourceBudget < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :currency

  # Validators
  validates_presence_of :member, :currency
  validates_presence_of :base_rate, :fiscal_year
  validates :base_rate, numericality: { greater_than_or_equal_to: 0 }
  validates :weekly_rate, numericality: { greater_than_or_equal_to: 0 }
  validates :monthly_rate, numericality: { greater_than_or_equal_to: 0 }
  validates :annual_rate, numericality: { greater_than_or_equal_to: 0 }

  enum classification:  [:salary, :contractor, :bonus]

  # Callback to calculate weekly, monthly, and annual rates before
  # saving the record.
  before_save :calculate_rates

  # Calculate weekly, monthly, and annual rates unless the record
  # is classified as a bonus.
  def calculate_rates
    case :classification
    when :salary
      # Requires annual rate to be entered
      base_rate = (annual_rate / 52) / 40
      weekly_rate = annual_rate / 52
      monthly_rate = annual_rate / 12
    when :contractor
      # Requires base rate to be entered (usually hourly)
      annual_rate = (base_rate * 40) * 52
      weekly_rate = base_rate * 40
      monthly_rate = annual_rate / 12
    when :bonus
      # Requires bonus to be entered into annual rate
      base_rate = 0
      weekly_rate = 0
      monthly_rate = 0
    end
  end
end
