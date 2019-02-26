class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index         # GET /tasks
    @tasks = Task.all
  end

  def show          # GET /tasks/:id
  end

  def new           # GET /tasks/new
    @task = Task.new
  end

  def create        # POST /tasks
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit          # GET /tasks/:id/edit
  end

  def update        # PATCH /tasks/:id
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy       # DELETE /tasks/:id
    @task.destroy
    # no need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path
  end

private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
