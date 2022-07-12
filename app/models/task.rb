class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  scope :latest, -> {order(deadline: :desc)}
  scope :like_title, -> (title) do where('title LIKE ?', "%#{title}%") if title.present? end
  scope :like_status, -> (status) do where('status LIKE ?', "%#{status}%") if status.present? end
end
