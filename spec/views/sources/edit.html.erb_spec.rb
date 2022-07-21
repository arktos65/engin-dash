require 'rails_helper'

RSpec.describe "sources/edit", type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      name: "MyString",
      contact_name: "MyString",
      contact_title: "MyString",
      contact_phone: "MyString",
      contact_email: "MyString",
      is_internal: false
    ))
  end

  it "renders the edit source form" do
    render

    assert_select "form[action=?][method=?]", source_path(@source), "post" do

      assert_select "input[name=?]", "source[name]"

      assert_select "input[name=?]", "source[contact_name]"

      assert_select "input[name=?]", "source[contact_title]"

      assert_select "input[name=?]", "source[contact_phone]"

      assert_select "input[name=?]", "source[contact_email]"

      assert_select "input[name=?]", "source[is_internal]"
    end
  end
end
