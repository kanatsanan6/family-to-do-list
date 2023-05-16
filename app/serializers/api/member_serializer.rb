# frozen_string_literal: true

class API::MemberSerializer < ActiveModel::Serializer
  attributes :name,
             :tasks

  def tasks
    # sample some completed tasks
    tasks = object.tasks.completed.sample(SAMPLE_TASKS)

    ActiveModel::Serializer::CollectionSerializer.new(tasks, serializer: API::TaskSerializer).as_json
  end

  private

  SAMPLE_TASKS = 3
end
