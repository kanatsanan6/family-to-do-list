# frozen_string_literal: true

class Members::TasksController < TasksController
  before_action :set_member, only: %i[index new create update]

  def index
    @tasks = @member.tasks
                    .then(&method(:paginate))
                    .then(&method(:order_by_state))
  end

  def new
    @task = @member.tasks.new
  end

  private

  def set_member
    @member = Member.find(params[:member_id])
  end
end
