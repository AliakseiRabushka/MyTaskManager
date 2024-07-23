class Board < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :users

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
