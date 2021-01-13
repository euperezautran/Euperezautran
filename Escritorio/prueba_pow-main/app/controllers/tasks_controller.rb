class TasksController < ApplicationController
before_action :set_todo_list
before_action :set_task, except: [:create]

  def create
    @task = @todo_list.tasks.create(task_params)
    redirect_to @todo_list
  end

  def destroy
    @task = @todo_list.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Todo List item was deleted."
    else
      flash[:error] = "Todo List item could not be deleted."
    end
    redirect_to @todo_list
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: "Task completed"
  end

  private

  def set_todo_list
   @todo_list = TodoList.find(params[:todo_list_id])
  end

  def task_params
   params[:task].permit(:content)
  end

  def set_task
    @task = @todo_list.tasks.find(params[:id])
  end

end
