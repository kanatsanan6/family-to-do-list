class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.integer :tasks_count, null: false, default: 0

      t.timestamps
    end
  end
end
