# frozen_string_literal: true

class DeleteTasksWorker
  include Sidekiq::Worker

  sidekiq_options queue: :default, retry: 0

  def perform
    Task.destroy_all
  end
end
