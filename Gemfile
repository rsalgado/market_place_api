source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


# Api Gems

group :development, :test do
  gem "factory_girl_rails"
  gem "ffaker"
end

group :test do
  gem "rspec-rails", "~> 2.14"
  gem "shoulda"
  gem "email_spec"
end

gem "active_model_serializers"
gem "devise"
gem "kaminari"
gem "delayed_job_active_record"

gem "sabisu_rails", github: "IcaliaLabs/sabisu-rails"

# This version had to be fixed to this version due to errors with the gem
# See: https://github.com/rails/sass-rails/issues/324
gem "compass-rails", "2.0.2"
gem "furatto"
gem "font-awesome-rails"
gem "simple_form"