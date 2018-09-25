
require 'time'

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      render :notfound, status: :not_found
    end
  end

  def edit
    @task = Task.find(params[:id].to_i)
  end

  # new and create are helping with adding a new task
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)

    if task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    task = Task.find_by(id: params[:id].to_i)

    task[:name] = params[:task][:name]
    task[:description] = params[:task][:description]
    task[:status] = params[:task][:status]
    task[:completion_date] = params[:task][:completion_date]

    if task.save
      redirect_to root_path
    else
      render :new
    end

  end

  def destroy
    task = Task.find_by(id: params[:id].to_i)
    task.destroy
    redirect_to root_path
  end


  def complete
    task = Task.find_by(id: params[:id].to_i)

    if task.active?
      task.update(active: true).save
      task.update_attribute(:completion_date, Time.now)
      redirect_to root_path, notice: "Todo item completed"
    else
      task.update(active: false)
    end


  end

  private

  def task_params
    return params.require(:task).permit(:name, :description, :status, :completion_date)
  end

end
