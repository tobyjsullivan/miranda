class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string :token, :unique => true
      t.belongs_to :board, foreign_key: true
      t.references :user, 'inviter', index: true
      t.timestamp :expires
      t.timestamp :accepted, :null => true

      t.timestamps
    end
    add_index :invitations, :token
  end
end
