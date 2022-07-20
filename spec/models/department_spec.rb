require 'rails_helper'

RSpec.describe Department, type: :model do
  subject {
    described_class.new(name: "Engineering",
                        division: "Technology",
                        manager: nil)
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a department name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
