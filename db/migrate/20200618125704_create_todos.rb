class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :text, null: false
      t.boolean :isCompleted, default: false
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
