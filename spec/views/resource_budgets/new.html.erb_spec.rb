require 'rails_helper'

RSpec.describe "resource_budgets/new", type: :view do
  before(:each) do
    assign(:resource_budget, ResourceBudget.new(
      member: nil,
      currency: nil,
      classification: 1,
      base_rate: "9.99",
      weekly_rate: "9.99",
      monthly_rate: "9.99",
      annual_rate: "9.99",
      fiscal_year: 1,
      comments: "MyText"
    ))
  end

  it "renders new resource_budget form" do
    render

    assert_select "form[action=?][method=?]", resource_budgets_path, "post" do

      assert_select "input[name=?]", "resource_budget[member_id]"

      assert_select "input[name=?]", "resource_budget[currency_id]"

      assert_select "input[name=?]", "resource_budget[classification]"

      assert_select "input[name=?]", "resource_budget[base_rate]"

      assert_select "input[name=?]", "resource_budget[weekly_rate]"

      assert_select "input[name=?]", "resource_budget[monthly_rate]"

      assert_select "input[name=?]", "resource_budget[annual_rate]"

      assert_select "input[name=?]", "resource_budget[fiscal_year]"

      assert_select "textarea[name=?]", "resource_budget[comments]"
    end
  end
end
