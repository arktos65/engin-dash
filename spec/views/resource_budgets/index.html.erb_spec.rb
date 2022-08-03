require 'rails_helper'

RSpec.describe "resource_budgets/index", type: :view do
  before(:each) do
    assign(:resource_budgets, [
      ResourceBudget.create!(
        member: nil,
        currency: nil,
        classification: 2,
        base_rate: "9.99",
        weekly_rate: "9.99",
        monthly_rate: "9.99",
        annual_rate: "9.99",
        fiscal_year: 3,
        comments: "MyText"
      ),
      ResourceBudget.create!(
        member: nil,
        currency: nil,
        classification: 2,
        base_rate: "9.99",
        weekly_rate: "9.99",
        monthly_rate: "9.99",
        annual_rate: "9.99",
        fiscal_year: 3,
        comments: "MyText"
      )
    ])
  end

  it "renders a list of resource_budgets" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
