class ResourceBudget < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :currency

  # Validators
  validates_presence_of :member, :currency
  validates_presence_of :base_rate, :fiscal_year
  validates :validate_base_rate_lt_zero

  enum :classification  [:salary, :contractor, :bonus]

  before_save :calculate_rates

  # Custom validator methods
  def validate_base_rate_lt_zero
    if self.base_rate < 0
      errors.add(:base_rate, "value can't be less than 0")
    end
  end

  # Calculate weekly, monthly, and annual rates unless the record
  # is classified as a bonus.
  def calculate_rates
    if :classification != :bonus
      self.annual_rate = (self.base_rate * 40) * 52
      self.weekly_rate = self.base_rate * 40
      self.monthly_rate = self.annual_rate / 12
    else
      self.annual_rate = 0
      self.weekly_rate = 0
      self.monthly_rate = 0
    end
  end
end
