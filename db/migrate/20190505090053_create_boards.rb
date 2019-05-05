class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title, null: false
      t.string :slug, null: false

      t.timestamps
    end

    create_join_table :users, :boards do |t|
      t.index :user_id
    end

    add_index :boards, :slug, unique: true
  end
end
