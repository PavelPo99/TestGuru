require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru20
  class Application < Rails::Application
    config.load_defaults 7.2

    config.time_zone = "Europe/Moscow"

    config.i18n.available_locales = [ :en, :ru ]
    config.i18n.default_locale = :ru


    config.autoload_lib(ignore: %w[assets tasks])

    config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
