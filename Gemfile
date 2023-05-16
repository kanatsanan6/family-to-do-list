source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'redis', '~> 4.0'
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
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0'
end
