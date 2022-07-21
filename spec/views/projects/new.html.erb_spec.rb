require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      stream: nil,
      name: "MyString",
      is_internal: false,
      is_trackable: false,
      is_active: false
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input[name=?]", "project[stream_id]"

      assert_select "input[name=?]", "project[name]"

      assert_select "input[name=?]", "project[is_internal]"

      assert_select "input[name=?]", "project[is_trackable]"

      assert_select "input[name=?]", "project[is_active]"
    end
  end
end
