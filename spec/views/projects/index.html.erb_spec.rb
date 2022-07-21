require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        stream: nil,
        name: "Name",
        is_internal: false,
        is_trackable: false,
        is_active: false
      ),
      Project.create!(
        stream: nil,
        name: "Name",
        is_internal: false,
        is_trackable: false,
        is_active: false
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
