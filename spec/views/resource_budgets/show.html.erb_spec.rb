require 'rails_helper'

RSpec.describe "resource_budgets/show", type: :view do
  before(:each) do
    @resource_budget = assign(:resource_budget, ResourceBudget.create!(
      member: nil,
      currency: nil,
      classification: 2,
      base_rate: "9.99",
      weekly_rate: "9.99",
      monthly_rate: "9.99",
      annual_rate: "9.99",
      fiscal_year: 3,
      comments: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
  end
end
