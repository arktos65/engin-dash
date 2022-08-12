# frozen_string_literal: true

class ResourceBudget < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :currency

  # Validators
  validates_presence_of :member, :currency
  validates_presence_of :base_rate, :fiscal_year
  validates :base_rate, numericality: { greater_than: 0 }

  enum classification:  [:salary, :contractor, :bonus]

  # Callback to calculate weekly, monthly, and annual rates before
  # saving the record.
  before_save :calculate_rates

  # Calculate weekly, monthly, and annual rates unless the record
  # is classified as a bonus.
  def calculate_rates
    if :classification != :bonus
      annual_rate = (base_rate * 40) * 52
      weekly_rate = base_rate * 40
      monthly_rate = annual_rate / 12
    else
      annual_rate = 0
      weekly_rate = 0
      monthly_rate = 0
    end
  end
end
