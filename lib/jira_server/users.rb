# frozen_string_literal: true
require 'jira-ruby'

# Module: JiraServer::Users
# Utility methods interacting with Jira User data from the API.
module JiraServer
  class Users
    # This paginated method returns all Jira users from the API.
    def self.find_all
      client = JIRA::Client.new(Connector.get_options)
      begin
        jira_users = client.User.all
      rescue StandardError => e
        puts e.message
        return
      end
      return jira_users
    end
  end
end