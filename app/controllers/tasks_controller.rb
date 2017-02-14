class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

    # GET /tasks
    def index
      @tasks = Task.all
    end

    # GET /tasks/:id
    def show
    end

    # GET /tasks/:id/edit
    def edit
    end

    # GET /tasks/new
    def new
      @task = Task.new
    end

    # PATCH /tasks/:id
    def update
      @task.update(task_params)
      redirect_to task_path(@task) # => task_path(@task) == /tasks/67
    end

    # POST /tasks
    def create
      Task.create(task_params)
      redirect_to tasks_path # tasks_path == /tasks
    end

    # DELETE /tasks/:id
    def destroy
      @task.destroy
      redirect_to tasks_path
    end

    private

    def task_params
      # params[:task] == params.require(:task)
      params.require(:task).permit(:name, :status)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
