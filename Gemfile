source 'https://rubygems.org'
source 'http://gems.github.com'

gem 'rails', '4.1.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'mongoid', git: 'git://github.com/mongoid/mongoid.git'
gem 'bson_ext'
# gem 'devise'
# gem 'redis'

# clean controllers
gem 'inherited_resources'

# use the elegant slim for templating
gem 'slim-rails'

group :development do
  # Use Capistrano for deployment
  gem 'capistrano-rails'
end

group :doc, :development, :test do
  # Generate the documentation: yardoc, see it: yard server , use option -r or --reload  to reload live
  gem 'yard'
end

group :development, :test do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Use byebug (replacement for debbuger not working with 2.1.3)
  gem 'byebug'
  # gem 'redcarpet'
  # gem rename
end

group :test do
  gem 'rspec-rails'
  gem 'rspec-support'
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use thin as the app server
gem 'thin'


