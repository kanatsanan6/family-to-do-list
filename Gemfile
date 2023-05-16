source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'active_model_serializers', '~> 0.10.13'
gem 'bootsnap', require: false
gem 'config', '~> 4.2'
gem 'importmap-rails'
gem 'jbuilder'
gem 'kaminari', '~> 1.2', '>= 1.2.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'redis', '~> 5.0'
gem 'sidekiq', '~> 7.1'
gem 'sidekiq-cron', '~> 1.10'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails', '~> 2.0', '>= 2.0.29'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.8'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'pry-byebug', '~> 3.10'
  gem 'rspec-rails', '~> 6.0'
end

group :development do
  gem 'annotate', '~> 3.2'
  gem 'rubocop', '~> 1.50'
  gem 'rubocop-performance', '~> 1.5'
  gem 'rubocop-rails', '~> 2.19'
  gem 'web-console'
end

group :test do
  gem 'database_cleaner', '~> 2.0'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-sidekiq', '~> 3.1'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0'
end

