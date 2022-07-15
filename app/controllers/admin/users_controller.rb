class Admin::UsersController < ApplicationController
  skip_before_action :login_already

  def index
    @users = User.all.order(created_at: :desc)
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end
  
  def destroy
  end
  
end
