class CreateJiraProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :jira_projects do |t|
      t.integer :project_id
      t.integer :jira_project_id
      t.text :name
      t.string :jira_key
      t.integer :total_issue_count
      t.datetime :last_issue_update
      t.text :self_url

      t.timestamps
    end
  end
end
