require 'rails_helper'

RSpec.describe Stream, type: :model do
  # Create data object for testing
  test_stream = FactoryBot.create(:stream)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_stream).to be_valid
  end
  it "is not valid without a name" do
    test_stream.name = nil
    expect(test_stream).to_not be_valid
  end
end
