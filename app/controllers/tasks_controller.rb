# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.includes(:member)
                 .then(&method(:paginate))
                 .then(&method(:order_by_state))
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(create_task_params)

    if @task.save
      redirect_to redirect_path, success: 'Create task successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.completed!
      redirect_to redirect_path, success: 'Mark task as completed'
    else
      redirect_to redirect_path, error: @task.errors.full_messages
    end
  end

  def destroy
    DeleteTasksWorker.perform_async

    head :no_content
  end

  private

  MEMBER_TASKS_PATTERN = %r{^/members/\d+/tasks(/new)?$}

  def redirect_path
    path = URI(request.referer).path
    return member_tasks_url(@member) if MEMBER_TASKS_PATTERN.match?(path)

    tasks_url
  end

  def order_by_state(records)
    records.order(state: :asc)
  end

  def create_task_params
    params.require(:task).permit(:member_id, :title)
  end
end
