require 'rails_helper'

RSpec.describe "departments/show", type: :view do
  before(:each) do
    @department = assign(:department, Department.create!(
      name: "Name",
      division: "Division",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Division/)
    expect(rendered).to match(//)
  end
end
