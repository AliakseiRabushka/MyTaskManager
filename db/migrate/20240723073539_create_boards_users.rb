class CreateBoardsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :boards_users, id: false do |t|
      t.belongs_to :board
      t.belongs_to :user
    end
  end
end
