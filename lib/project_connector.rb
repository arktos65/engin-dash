# frozen_string_literal: true

# Module: ProjectConnector
# Provides the connection string needed by the JIRA::Client
# to access the instance of your Jira API.
module ProjectConnector
  # For security reasons, the values for the connect options should be stored
  # as environment variables and NEVER included in source code.
  def get_options
    # Using an API token associated with a Jira user account
    {
      username: ENV['JIRA_USER'],
      password: ENV['JIRA_API_KEY'],
      site: ENV['JIRA_SITE'],
      context_path: ENV['JIRA_CONTEXT'],
      auth_type: :basic,
      read_timeout: 120
    }
  end
end
