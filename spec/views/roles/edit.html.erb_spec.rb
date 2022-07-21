require 'rails_helper'

RSpec.describe "roles/edit", type: :view do
  before(:each) do
    @role = assign(:role, Role.create!(
      name: "MyString",
      is_shared: false,
      is_administration: false,
      department: nil
    ))
  end

  it "renders the edit role form" do
    render

    assert_select "form[action=?][method=?]", role_path(@role), "post" do

      assert_select "input[name=?]", "role[name]"

      assert_select "input[name=?]", "role[is_shared]"

      assert_select "input[name=?]", "role[is_administration]"

      assert_select "input[name=?]", "role[department_id]"
    end
  end
end
