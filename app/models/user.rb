class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }

  before_update :admin_cannot_update
  before_destroy :admin_cannot_delete

  private

  def admin_cannot_update
    throw :abort if User.where(admin: true).count == 1 && self.admin_change == [true, false]
  end
  
  def admin_cannot_delete
    throw :abort if User.where(admin: true).count == 1 && self.admin == true
  end
end
