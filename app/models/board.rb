class Board < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
end
