require 'rails_helper'

RSpec.describe "members/edit", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      first_name: "MyString",
      last_name: "MyString",
      is_active: false,
      role: nil,
      department: nil,
      source: nil
    ))
  end

  it "renders the edit member form" do
    render

    assert_select "form[action=?][method=?]", member_path(@member), "post" do

      assert_select "input[name=?]", "member[first_name]"

      assert_select "input[name=?]", "member[last_name]"

      assert_select "input[name=?]", "member[is_active]"

      assert_select "input[name=?]", "member[role_id]"

      assert_select "input[name=?]", "member[department_id]"

      assert_select "input[name=?]", "member[source_id]"
    end
  end
end
