class AddUserToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :nickname, :string
    add_reference :tasks, :user
  end
end
