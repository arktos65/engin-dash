require 'rails_helper'

RSpec.describe "departments/index", type: :view do
  before(:each) do
    assign(:departments, [
      Department.create!(
        name: "Name",
        division: "Division",
        user: nil
      ),
      Department.create!(
        name: "Name",
        division: "Division",
        user: nil
      )
    ])
  end

  it "renders a list of departments" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Division".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
