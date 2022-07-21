require 'rails_helper'

RSpec.describe "roles/index", type: :view do
  before(:each) do
    assign(:roles, [
      Role.create!(
        name: "Name",
        is_shared: false,
        is_administration: false,
        department: nil
      ),
      Role.create!(
        name: "Name",
        is_shared: false,
        is_administration: false,
        department: nil
      )
    ])
  end

  it "renders a list of roles" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
