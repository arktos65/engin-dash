require 'rails_helper'

RSpec.describe "roles/new", type: :view do
  before(:each) do
    assign(:role, Role.new(
      name: "MyString",
      is_shared: false,
      is_administration: false,
      department: nil
    ))
  end

  it "renders new role form" do
    render

    assert_select "form[action=?][method=?]", roles_path, "post" do

      assert_select "input[name=?]", "role[name]"

      assert_select "input[name=?]", "role[is_shared]"

      assert_select "input[name=?]", "role[is_administration]"

      assert_select "input[name=?]", "role[department_id]"
    end
  end
end
