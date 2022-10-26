class AddJiraAccountIdToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :jira_account_id, :string
    add_index :members, :jira_account_id
  end
end
