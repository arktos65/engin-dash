class CreateJiraIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :jira_issues do |t|
      t.integer :jira_issue_id
      t.belongs_to :jira_project, null: false, foreign_key: true
      t.string :issue_key
      t.text :issue_url
      t.text :issue_title
      t.string :issue_status
      t.string :issue_type
      t.integer :story_points
      t.datetime :issue_created
      t.datetime :issue_updated

      t.timestamps
    end
  end
end
