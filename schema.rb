require_relative 'environment'

class CreateTasksTable < ActiveRecord::Migration[5.0]

  def up
    create_table :tasks do |t|
      t.string :description
      t.integer :priority,  null: false
      t.integer :completed, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end

  def down
    drop_table :tasks
  end

end

def main
  action = (ARGV[0] || :up).to_sym

  CreateTasksTable.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
