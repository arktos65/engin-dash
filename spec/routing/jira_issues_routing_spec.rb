require "rails_helper"

RSpec.describe JiraIssuesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/jira_issues").to route_to("jira_issues#index")
    end

    it "routes to #new" do
      expect(get: "/jira_issues/new").to route_to("jira_issues#new")
    end

    it "routes to #show" do
      expect(get: "/jira_issues/1").to route_to("jira_issues#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/jira_issues/1/edit").to route_to("jira_issues#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/jira_issues").to route_to("jira_issues#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/jira_issues/1").to route_to("jira_issues#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/jira_issues/1").to route_to("jira_issues#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/jira_issues/1").to route_to("jira_issues#destroy", id: "1")
    end
  end
end
