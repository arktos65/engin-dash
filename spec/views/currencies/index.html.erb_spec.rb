require 'rails_helper'

RSpec.describe "currencies/index", type: :view do
  before(:each) do
    assign(:currencies, [
      Currency.create!(
        name: "Name",
        code: "Code",
        exchange_rate: "9.99"
      ),
      Currency.create!(
        name: "Name",
        code: "Code",
        exchange_rate: "9.99"
      )
    ])
  end

  it "renders a list of currencies" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Code".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
