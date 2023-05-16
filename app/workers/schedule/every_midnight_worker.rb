# frozen_string_literal: true

class Schedule::EveryMidnightWorker
  include Sidekiq::Worker

  def perform
    Task.incompleted.each do |task|
      task.delayed!
    end
  end
end
