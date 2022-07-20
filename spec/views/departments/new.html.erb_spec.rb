require 'rails_helper'

RSpec.describe "departments/new", type: :view do
  before(:each) do
    assign(:department, Department.new(
      name: "MyString",
      division: "MyString",
      user: nil
    ))
  end

  it "renders new department form" do
    render

    assert_select "form[action=?][method=?]", departments_path, "post" do

      assert_select "input[name=?]", "department[name]"

      assert_select "input[name=?]", "department[division]"

      assert_select "input[name=?]", "department[user_id]"
    end
  end
end
