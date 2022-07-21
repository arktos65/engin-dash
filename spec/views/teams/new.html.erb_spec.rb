require 'rails_helper'

RSpec.describe "teams/new", type: :view do
  before(:each) do
    assign(:team, Team.new(
      member: nil,
      project: nil,
      currency: nil,
      annual_rate: "9.99",
      weekly_rate: "9.99",
      allocation: 1
    ))
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", teams_path, "post" do

      assert_select "input[name=?]", "team[member_id]"

      assert_select "input[name=?]", "team[project_id]"

      assert_select "input[name=?]", "team[currency_id]"

      assert_select "input[name=?]", "team[annual_rate]"

      assert_select "input[name=?]", "team[weekly_rate]"

      assert_select "input[name=?]", "team[allocation]"
    end
  end
end
