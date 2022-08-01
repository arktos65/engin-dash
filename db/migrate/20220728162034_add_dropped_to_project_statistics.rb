class AddDroppedToProjectStatistics < ActiveRecord::Migration[6.1]
  def change
    add_column :project_statistics, :dropped_bugs, :integer
    add_column :project_statistics, :dropped_stories, :integer
    add_column :project_statistics, :dropped_tasks, :integer
  end
end
