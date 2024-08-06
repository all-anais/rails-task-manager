class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
    if @tasks["completed"]
      @message = "Task completed"
    else
      @message = "Task incompleted"
    end
  end
  def new
    @tasks = Task.new
  end

  def create
    # Créer un restaurant avec les informations passées dans le form
    @task = Task.new(task_params)
    @task.save
    # redirect_to restaurant_path(id: @restaurant.id)
    # Same as
    redirect_to task_path(@task)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path(@task), status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
