class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  scope :latest, -> {order(deadline: :desc)}
end
