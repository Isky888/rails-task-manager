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
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  def complete
    @task = Task.find(params[:format])
    @task.completed = true
    @task.save
    redirect_to tasks_path(@task)
  end

  def uncomplete
    @task = Task.find(params[:format])
    @task.completed = false
    @task.save
    redirect_to tasks_path(@task)
  end
  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
