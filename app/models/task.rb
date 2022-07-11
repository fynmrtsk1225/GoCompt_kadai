class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  scope :latest, -> {order(deadline: :desc)}
  # scope :title_like, -> {where('title LIKE ?', "%#{params[:title]}%") if params[:title].present?}
  # scope :status_like, -> {where('status LIKE ?', "%#{params[:status]}%") if params[:status].present?}
end
