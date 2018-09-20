
# TASKS = ['eat', 'code', 'sleep']

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:completion_date)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      render :notfound, status: :not_found
    end
  end

  # new and create are helping with adding a new task
  #
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], completion_date: params[:task][:completion_date], status: params[:task][:status])

    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

end
