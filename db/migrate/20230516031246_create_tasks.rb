class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.integer :state, null: false, default: 0
      t.references :member, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
