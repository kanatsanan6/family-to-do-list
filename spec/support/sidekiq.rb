# frozen_string_literal: true
Sidekiq::Testing.fake!
RSpec::Sidekiq.configure do |config|
  config.warn_when_jobs_not_processed_by_sidekiq = false
end
RSpec.configure do |config|
  config.before { Sidekiq::Worker.clear_all }
end
