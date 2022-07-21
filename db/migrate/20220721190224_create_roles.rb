class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :is_shared
      t.boolean :is_administration
      t.belongs_to :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
