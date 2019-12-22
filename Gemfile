# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "active_model_serializers", "~> 0.10.0"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap", "~> 4.3.1"
gem "font-awesome-rails"
gem "jquery-rails"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "puma", "~> 3.12"
gem "rails", "~> 5.2.3"
gem "sass-rails", "~> 5.0"
gem "uglifier"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "rubocop", "~> 0.71.0", require: false
  gem "rubocop-github"
  gem "rubocop-rails"
  gem "shoulda-matchers"
  gem "spring-commands-rspec"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :production do
  gem "rails_12factor"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
