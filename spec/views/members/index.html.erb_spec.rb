require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        first_name: "First Name",
        last_name: "Last Name",
        is_active: false,
        role: nil,
        department: nil,
        source: nil
      ),
      Member.create!(
        first_name: "First Name",
        last_name: "Last Name",
        is_active: false,
        role: nil,
        department: nil,
        source: nil
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
