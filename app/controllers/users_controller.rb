class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  skip_before_action :login_already, only: [:show]
  before_action :ensure_user, only: %i[ show ]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tasks = current_user.tasks
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  private

  def ensure_user
    @users = current_user
    @user = User.find(params[:id])
    redirect_to tasks_path if @user.id != @users.id && @users.admin != true
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
