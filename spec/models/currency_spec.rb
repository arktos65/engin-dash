require 'rails_helper'

RSpec.describe Currency, type: :model do
  # Data object to be tested
  subject {
    described_class.new(name: "Euro",
                        code: "EUR",
                        exchange_rate: 1.12)
  }

  # Test various conditions
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without currency name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without currency symbol code" do
    subject.code = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an USD exchange rate value" do
    subject.exchange_rate = nil
    expect(subject).to_not be_valid
  end
end
