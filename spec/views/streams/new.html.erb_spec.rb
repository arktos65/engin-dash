require 'rails_helper'

RSpec.describe "streams/new", type: :view do
  before(:each) do
    assign(:stream, Stream.new(
      name: "MyString",
      business_unit: "MyString",
      stakeholder_name: "MyString",
      stakeholder_email: "MyString"
    ))
  end

  it "renders new stream form" do
    render

    assert_select "form[action=?][method=?]", streams_path, "post" do

      assert_select "input[name=?]", "stream[name]"

      assert_select "input[name=?]", "stream[business_unit]"

      assert_select "input[name=?]", "stream[stakeholder_name]"

      assert_select "input[name=?]", "stream[stakeholder_email]"
    end
  end
end
