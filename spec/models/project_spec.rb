require 'rails_helper'

RSpec.describe Project, type: :model do
  # Create data objects for testing
  test_stream = FactoryBot.create(:stream)
  test_project = FactoryBot.create(:project, stream_id: test_stream.id)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_project).to be_valid
  end
  it "is not valid without a project name" do
    test_project.name = nil
    expect(test_project).to_not be_valid
  end
  it "is not valid without an assigned stream" do
    test_project.stream_id = nil
    expect(test_project).to_not be_valid
  end
end
