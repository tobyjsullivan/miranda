class Invitation < ApplicationRecord
  has_secure_token

  belongs_to :board
  belongs_to :inviter, class_name: :User, foreign_key: 'inviter_id'
end
