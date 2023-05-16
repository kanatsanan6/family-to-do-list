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
      redirect_to tasks_url, success: 'Create task successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.completed!
      redirect_to tasks_url, success: 'Mark task as completed'
    else
      redirect_to tasks_url, error: @task.errors.full_messages
    end
  end

  private

  def order_by_state(records)
    records.order(state: :asc)
  end

  def create_task_params
    params.require(:task).permit(:member_id, :title)
  end
end
