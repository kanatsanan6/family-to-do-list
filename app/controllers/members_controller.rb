# frozen_string_literal: true

class MembersController < ApplicationController
  def index
    @members = Member.order(created_at: :asc)
                     .then(&method(:paginate))
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(create_member_params)

    if @member.save
      redirect_to root_url, success: 'Create member successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def create_member_params
    params.require(:member).permit(:name)
  end
end
