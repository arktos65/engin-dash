class CreateProjectStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :project_statistics do |t|
      t.belongs_to :stream, null: false, foreign_key: true
      t.text :stream_name
      t.belongs_to :project, null: false, foreign_key: true
      t.string :project_name
      t.integer :week_number
      t.integer :month_number
      t.integer :year_number
      t.integer :bug_count
      t.integer :story_count
      t.integer :task_count
      t.integer :team_count
      t.integer :open_bugs
      t.integer :open_stories
      t.integer :open_tasks
      t.integer :closed_bugs
      t.integer :closed_stories
      t.integer :closed_tasks
      t.integer :capex_points
      t.integer :opex_points
      t.decimal :weekly_team_cost
      t.decimal :weekly_capex
      t.decimal :weekly_opex

      t.timestamps
    end
  end
end
