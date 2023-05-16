# frozen_string_literal: true
require 'redis'
$redis = Redis.new(url: Settings.redis.url)
