class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title_task
      t.text :body
      t.string :status
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
