source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.13'

gem 'annotate'
gem 'bootstrap-sass'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jcrop-rails'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'haml-rails'
gem 'simple_form'
gem 'cocoon', '1.1.2'
gem 'faker'
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap'
gem 'geocoder'
gem "stripe", "~> 1.8.4"
gem "paperclip", "~> 3.0"

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'html2haml'
  gem 'quiet_assets'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem "shoulda-matchers"
end
group :production, :staging do
  gem 'unicorn'
  gem 'pg'
  gem 'dalli'
  gem 'memcachier'
end
group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
end
