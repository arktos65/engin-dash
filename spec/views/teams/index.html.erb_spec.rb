require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
        member: nil,
        project: nil,
        currency: nil,
        annual_rate: "9.99",
        weekly_rate: "9.99",
        allocation: 2
      ),
      Team.create!(
        member: nil,
        project: nil,
        currency: nil,
        annual_rate: "9.99",
        weekly_rate: "9.99",
        allocation: 2
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
