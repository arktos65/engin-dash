require 'rails_helper'

RSpec.describe "teams/edit", type: :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      member: nil,
      project: nil,
      currency: nil,
      annual_rate: "9.99",
      weekly_rate: "9.99",
      allocation: 1
    ))
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(@team), "post" do

      assert_select "input[name=?]", "team[member_id]"

      assert_select "input[name=?]", "team[project_id]"

      assert_select "input[name=?]", "team[currency_id]"

      assert_select "input[name=?]", "team[annual_rate]"

      assert_select "input[name=?]", "team[weekly_rate]"

      assert_select "input[name=?]", "team[allocation]"
    end
  end
end
