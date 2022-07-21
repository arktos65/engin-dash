require 'rails_helper'

RSpec.describe "sources/index", type: :view do
  before(:each) do
    assign(:sources, [
      Source.create!(
        name: "Name",
        contact_name: "Contact Name",
        contact_title: "Contact Title",
        contact_phone: "Contact Phone",
        contact_email: "Contact Email",
        is_internal: false
      ),
      Source.create!(
        name: "Name",
        contact_name: "Contact Name",
        contact_title: "Contact Title",
        contact_phone: "Contact Phone",
        contact_email: "Contact Email",
        is_internal: false
      )
    ])
  end

  it "renders a list of sources" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Contact Name".to_s, count: 2
    assert_select "tr>td", text: "Contact Title".to_s, count: 2
    assert_select "tr>td", text: "Contact Phone".to_s, count: 2
    assert_select "tr>td", text: "Contact Email".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
