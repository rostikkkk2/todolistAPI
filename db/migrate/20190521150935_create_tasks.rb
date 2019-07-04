class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.datetime :deadline
      t.boolean :complete, default: false
      t.integer :position
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
