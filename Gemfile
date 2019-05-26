source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'acts_as_list'
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave', '~> 1.0'
gem 'faker'
gem 'jbuilder', '~> 2.5'
gem 'jwt_sessions'
gem 'mini_magick'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'pundit'
gem 'rack-cors'
gem 'rails', '~> 5.2.3'
gem 'redis', '~> 4.0'
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.8'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.65.0', require: false
  gem 'rubocop-rspec', '~> 1.32', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'dox', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'json_matchers', '~> 0.4.0'
  gem 'simplecov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
