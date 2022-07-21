require 'rails_helper'

RSpec.describe "sources/show", type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      name: "Name",
      contact_name: "Contact Name",
      contact_title: "Contact Title",
      contact_phone: "Contact Phone",
      contact_email: "Contact Email",
      is_internal: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Contact Name/)
    expect(rendered).to match(/Contact Title/)
    expect(rendered).to match(/Contact Phone/)
    expect(rendered).to match(/Contact Email/)
    expect(rendered).to match(/false/)
  end
end
