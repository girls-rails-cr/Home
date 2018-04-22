source 'https://rubygems.org'
ruby '2.4.1'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'


#gem 'bootstrap'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'jquery-countdown-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Devise for  authentication,  see here: https://github.com/plataformatec/devise
gem 'devise'
# Gibbon is an API wrapper for MailChimp's API, see here: https://github.com/amro/gibbon
gem 'gibbon', :git => 'https://github.com/amro/gibbon.git'
# Jobs background
gem 'sucker_punch', '~> 2.0'
#Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file
gem "figaro"
#Metamagic is a simple Ruby on Rails plugin for creating meta tags.
gem 'metamagic'

gem 'delayed_job_active_record'

gem "font-awesome-rails"
#This gem provides a simple and extremely flexible way to upload files from Ruby applications. Read more here: https://github.com/carrierwaveuploader/carrierwave
gem 'carrierwave', '>= 1.0.0.rc', '< 2.0'
#Cocoon makes it easier to handle nested forms. Read more here: https://github.com/nathanvda/cocoon
gem "cocoon"
#This gem provides popper.js assets as a Ruby gem. Read more here: https://github.com/glebm/popper_js-rubygem
gem 'popper_js'
# I was using RMagick and loving it, but it was eating up huge amounts of memory. Read more here: https://github.com/minimagick/minimagick
gem "mini_magick"
# Create beautiful JavaScript charts with one line of Ruby. No more fighting with charting libraries.  Read more here: https://github.com/ankane/chartkick
gem "chartkick"
#The simplest way to group temporal data. Read more here: https://github.com/ankane/groupdate
gem 'groupdate'
gem 'active_median'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'brakeman', :require => false
  # Fast debugging with Pry. (https://github.com/deivid-rodriguez/pry-byebug)
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # LiveReload guard allows to automatically reload your browser when 'view' files are modified. Read more:  https://github.com/guard/guard-livereload
  gem 'guard-livereload', '~> 2.5', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
  # Add a comment summarizing the current schema to the top or bottom of each, Read more here: https://github.com/ctran/annotate_models
  gem 'annotate'
  #RuboCop is a Ruby static code analyzer. Out of the box it will enforce many of the guidelines outlined in the community, Read more here: https://github.com/bbatsov/rubocop
  gem 'rubocop', require: false
end

group :production do
  # Module for the 'fog' gem to support Amazon Web Services http://aws.amazon.com/  Read more here: https://github.com/fog/fog-aws
  gem 'fog', require: 'fog/aws'
  gem 'hirefire-resource'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
