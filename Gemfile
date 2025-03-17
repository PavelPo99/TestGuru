source "https://rubygems.org"

# Измените версию Rails на явную 7.0.x
gem "rails", "~> 7.0", ">= 7.0.8"

# Используйте совместимую версию rails-i18n для Rails 7
gem "rails-i18n", "~> 7.0"

# Остальные гемы остаются без изменений
gem "sprockets-rails"
gem "pg", "~> 1.5", ">= 1.5.9"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "bootsnap", require: false
gem "faker", "~> 3.5", ">= 3.5.1"
gem "devise", "~> 4.9"
gem "octokit"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem "listen", "~> 3.9"
  gem "letter_opener"
  gem "dotenv-rails"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
