require "rails_helper"

RSpec.describe JiraProjectsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/jira_projects").to route_to("jira_projects#index")
    end

    it "routes to #new" do
      expect(get: "/jira_projects/new").to route_to("jira_projects#new")
    end

    it "routes to #show" do
      expect(get: "/jira_projects/1").to route_to("jira_projects#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/jira_projects/1/edit").to route_to("jira_projects#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/jira_projects").to route_to("jira_projects#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/jira_projects/1").to route_to("jira_projects#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/jira_projects/1").to route_to("jira_projects#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/jira_projects/1").to route_to("jira_projects#destroy", id: "1")
    end
  end
end
