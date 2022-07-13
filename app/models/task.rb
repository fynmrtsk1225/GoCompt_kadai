class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  scope :latest, -> {order(deadline: :desc)}
  scope :top_priority, -> {order(priority: :desc)}
  scope :like_title, -> (title) do where('title LIKE ?', "%#{title}%") end
  scope :like_status, -> (status) do where(status: status) end
  enum priority: {低: 1, 中: 2, 高: 3, 最優先: 4}
  enum status: {済: 1, 進行中: 2, 未着手: 3}
end
