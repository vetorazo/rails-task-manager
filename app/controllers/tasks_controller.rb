class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # get attributes from parameter
    task_params = params.require(:task).permit(:title, :details)
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end
end
