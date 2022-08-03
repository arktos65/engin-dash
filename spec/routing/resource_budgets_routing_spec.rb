require "rails_helper"

RSpec.describe ResourceBudgetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/resource_budgets").to route_to("resource_budgets#index")
    end

    it "routes to #new" do
      expect(get: "/resource_budgets/new").to route_to("resource_budgets#new")
    end

    it "routes to #show" do
      expect(get: "/resource_budgets/1").to route_to("resource_budgets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/resource_budgets/1/edit").to route_to("resource_budgets#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/resource_budgets").to route_to("resource_budgets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/resource_budgets/1").to route_to("resource_budgets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/resource_budgets/1").to route_to("resource_budgets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/resource_budgets/1").to route_to("resource_budgets#destroy", id: "1")
    end
  end
end
