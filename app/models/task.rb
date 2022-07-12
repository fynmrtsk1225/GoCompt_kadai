class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  scope :latest, -> {order(deadline: :desc)}
  scope :like_title, -> (params) do where('title LIKE ?', "%#{params[:title]}%") if params[:title].present? end
  scope :like_status, -> (params) do where('status LIKE ?', "%#{params[:status]}%") if params[:status].present? end
end
