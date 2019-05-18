require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  minimum_coverage 95
  add_filter 'app/admin'
end

require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

# require 'dox'
require 'support/helpers'
require 'rspec/rails'
require 'database_cleaner'
require 'faker'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  config.include Shoulda::Matchers::ActiveModel, type: :model
  config.include Shoulda::Matchers::ActiveRecord, type: :model
  config.include Shoulda::Matchers::ActionController

  config.include Helpers

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  # config.after(:each, :dox) do |example|
  #   example.metadata[:request] = request
  #   example.metadata[:response] = response
  # end

  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
