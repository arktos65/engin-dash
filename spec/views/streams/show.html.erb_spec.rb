require 'rails_helper'

RSpec.describe "streams/show", type: :view do
  before(:each) do
    @stream = assign(:stream, Stream.create!(
      name: "Name",
      business_unit: "Business Unit",
      stakeholder_name: "Stakeholder Name",
      stakeholder_email: "Stakeholder Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Business Unit/)
    expect(rendered).to match(/Stakeholder Name/)
    expect(rendered).to match(/Stakeholder Email/)
  end
end
