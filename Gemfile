source 'http://rubygems.org'

gem 'rails', '3.1.3'

#front
gem 'execjs'
gem 'therubyracer'
gem 'rails-backbone'
gem 'jquery-rails'
gem 'ejs'
gem 'haml_assets'
gem 'haml', :git => 'https://github.com/infbio/haml.git', :branch => 'form_for_fix'
gem 'jquery-rails'

#back
gem 'acts_as_list'                       
gem 'sqlite3'
gem 'pusher'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem "compass", "~> 0.12.alpha.0"
  gem 'sassy-buttons'
end

group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails", "~> 2.6.1"
  gem 'jasmine', "= 1.1.0.rc4"
  gem 'jasminerice'
  #gem 'shoulda-matchers'
  #gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  #gem 'cucumber'
  #gem 'factory_girl_rails'
  #gem 'launchy'
  gem 'database_cleaner'
  gem 'rb-fsevent'        
  gem 'guard-rspec'        #guard init rspec
  gem 'guard-livereload'   #guard init livereload
  gem 'growl'
end

group :development do
  gem 'capistrano'
  gem 'openminds_deploy'
end


group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem "capybara", "~> 1.1.1"
  gem "selenium-webdriver", "~> 2.10.0"
  gem 'cucumber-rails', "~> 1.0.2"
  gem "factory_girl_rails"
  gem "bourne"
  gem "nokogiri"
  gem "shoulda"
  gem "launchy"
  gem "guard-spork"
  gem "spork", "~> 0.9.0.rc"
end
