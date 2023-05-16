# frozen_string_literal: true

class API::V1::TasksController < API::V1::BaseController
  def index
    members = Member.order(name: :asc).includes(:tasks).where(tasks: { state: :completed })

    render json: ActiveModel::Serializer::CollectionSerializer.new(members, serializer: API::MemberSerializer)
  end
end
