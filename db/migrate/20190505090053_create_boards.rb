class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end

    create_join_table :users, :boards do |t|
      t.index :user_id
    end

    add_index :boards, :slug
  end
end
