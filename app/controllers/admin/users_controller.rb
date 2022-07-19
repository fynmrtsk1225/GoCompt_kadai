class Admin::UsersController < ApplicationController
  skip_before_action :login_already
  before_action :admin_user

  def index
    @users = User.all.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'User was successfully destroyed.'
  end

  def change
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    redirect_to admin_users_path
  end
  

  private

  def admin_user
    @users = current_user
    redirect_to tasks_path, notice: 'Only the administrator can access it.' if @users.admin != true
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
  
end
