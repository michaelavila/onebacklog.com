source 'https://rubygems.org'
ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :test, :development do
  gem 'rspec-rails', '2.14.0'
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'database_cleaner', '1.0.1'
  gem 'capybara', '2.1.0'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Use launch for debugging with capybaray using
  # save_and_open_page
  gem 'launchy'

  # Use poltergeist for headless browser based testing
  gem 'poltergeist'

  # Use for testing email behavior
  gem 'mailcatcher'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

# Use for tagging
gem 'acts-as-taggable-on'

# Use for commenting
gem 'acts_as_commentable'

# Use for user management
gem 'devise', '3.0.0'

# Use for foreign key addition migrations
gem 'foreigner'

# Use for editing in place
gem 'best_in_place', github: 'aaronchi/best_in_place'

# Use for icons
gem 'font-awesome-rails', '3.1.1.2'

# HAML!
gem 'haml-rails', '0.4'
