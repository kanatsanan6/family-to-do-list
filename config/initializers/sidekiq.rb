# frozen_string_literal: true
require 'sidekiq/web'
Sidekiq.configure_server do |config|
  config.redis = { url: $redis.id }
end
Sidekiq.configure_client do |config|
  config.redis = { url: $redis.id }
end
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"
