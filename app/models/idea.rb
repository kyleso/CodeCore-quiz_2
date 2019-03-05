class Idea < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 50 }
end
