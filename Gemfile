source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 6.1.7', '>= 6.1.7.10'
gem 'pg'
gem 'faker', '~> 3.5', '>= 3.5.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem "hotwire-rails", "~> 0.1.3"
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'bootsnap', '>= 1.4.4', require: false

# AUTH
gem 'devise', '~> 4.9'

# LOCALIZATION
gem 'rails-i18n', '~> 6.0'

# UI
gem 'jquery-rails'
gem 'bootstrap', '~> 5.3.3'

# GIST
gem "octokit"

# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'letter_opener'
  gem 'dotenv-rails'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
end
