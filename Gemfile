source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.5"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
# gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
gem 'devise'
gem 'cancancan'
gem 'kaminari'
gem 'carrierwave', '~> 2.0'
gem 'rmagick'
gem 'sitemap_generator'
gem 'meta-tags'
gem 'gretel'
gem 'nokogiri', '>= 1.18.9'
gem 'impressionist'
gem 'acts-as-taggable-on'
gem 'acts_as_commentable_with_threading'
gem 'acts_as_votable'
gem 'globalize'

gem 'omniauth'
gem 'oauth2'
gem 'omniauth-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-facebook'
gem 'omniauth-naver'
gem 'omniauth-google-oauth2'
gem 'omniauth-apple'
gem 'omniauth-twitter'
gem 'omniauth-github'
#gem 'omniauth-kakao', path: "lib/omniauth-kakao"

gem 'sassc-rails'
gem 'bootstrap', '~> 5.3'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]

  # Capistrano
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-yarn'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

group :production do
  gem 'asset_sync'
  gem 'fog-azure-rm', git: 'https://github.com/sleepinglion/fog-azure-rm'
  gem 'mysql2'
  gem "redis", "~> 5.0" # Redis client for Ruby
  gem "redis-actionpack", "~> 5.3" # Redis session store for ActionPack
  gem 'dotenv-rails'
  gem 'recaptcha', :require => 'recaptcha/rails'
  gem 'rails-letsencrypt'
end

