require 'rails_helper'

RSpec.describe "streams/edit", type: :view do
  before(:each) do
    @stream = assign(:stream, Stream.create!(
      name: "MyString",
      business_unit: "MyString",
      stakeholder_name: "MyString",
      stakeholder_email: "MyString"
    ))
  end

  it "renders the edit stream form" do
    render

    assert_select "form[action=?][method=?]", stream_path(@stream), "post" do

      assert_select "input[name=?]", "stream[name]"

      assert_select "input[name=?]", "stream[business_unit]"

      assert_select "input[name=?]", "stream[stakeholder_name]"

      assert_select "input[name=?]", "stream[stakeholder_email]"
    end
  end
end
