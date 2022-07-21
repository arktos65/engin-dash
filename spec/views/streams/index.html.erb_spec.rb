require 'rails_helper'

RSpec.describe "streams/index", type: :view do
  before(:each) do
    assign(:streams, [
      Stream.create!(
        name: "Name",
        business_unit: "Business Unit",
        stakeholder_name: "Stakeholder Name",
        stakeholder_email: "Stakeholder Email"
      ),
      Stream.create!(
        name: "Name",
        business_unit: "Business Unit",
        stakeholder_name: "Stakeholder Name",
        stakeholder_email: "Stakeholder Email"
      )
    ])
  end

  it "renders a list of streams" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Business Unit".to_s, count: 2
    assert_select "tr>td", text: "Stakeholder Name".to_s, count: 2
    assert_select "tr>td", text: "Stakeholder Email".to_s, count: 2
  end
end
