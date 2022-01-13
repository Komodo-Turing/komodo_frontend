# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'simplecov'
SimpleCov.start
require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
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

VCR.configure do |config|
    config.allow_http_connections_when_no_cassette = true
    config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
    config.hook_into :webmock
    config.filter_sensitive_data("Hide My Key") { ENV["govt_api_key"] }  #if you want to hide the key in the cassete
    config.configure_rspec_metadata!  #it will name the cassette automatically under the folder of spec test name, with folder named with the test name.
end

def contacts_data_for_test
  {:data=>
  [{:id=>"1",
    :type=>"contact",
    :attributes=>{:user_id=>1, :name=>"Stuart Mohr", :phone_number=>"1-695-855-2883"}},
   {:id=>"2",
    :type=>"contact",
    :attributes=>{:user_id=>1, :name=>"Charlsie Feest", :phone_number=>"(621) 155-8903"}},
   {:id=>"3",
    :type=>"contact",
    :attributes=>{:user_id=>1, :name=>"Irvin Smitham", :phone_number=>"1-833-106-4178"}},
   {:id=>"4",
    :type=>"contact",
    :attributes=>{:user_id=>1, :name=>"Leisa Pagac", :phone_number=>"1-338-471-7538"}},
   {:id=>"5",
    :type=>"contact",
    :attributes=>{:user_id=>1, :name=>"Cythia Cruickshank", :phone_number=>"1-147-656-4139"}}
    ]
  }
end

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    :provider => "google_oauth2",
    :uid => "123456789",
    :info => {
      :name => "Tony Stark",
      :email => "tony@stark.com"
    },
    :credentials => {
      :token => "token",
      :refresh_token => "refresh token"
    }
  }
)
