class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_already
  
  # GET /tasks
  def index
    @tasks = current_user.tasks.all.order(created_at: :desc).page(params[:page]).per(5)

    if params[:sort_deadline]
      @tasks = current_user.tasks.latest.page(params[:page]).per(5)
    elsif params[:sort_priority]
      @tasks = current_user.tasks.top_priority.page(params[:page]).per(5)
    end
    
    title = params[:title]
    status = params[:status]
    
    @tasks = current_user.tasks.like_title(title).page(params[:page]).per(5) if title.present?
    @tasks = @tasks.like_status(status).page(params[:page]).per(5) if status.present?

  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:title, :content, :deadline, :created_at, :priority, :status)
    end
end
