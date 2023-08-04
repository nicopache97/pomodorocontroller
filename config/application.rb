require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pomodoro
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # Desactivar Turbo Streams en toda la aplicación
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "America/Argentina/Buenos_Aires"
    config.hosts << "pomodorocontroller-nicopacheco2023-dev.fl0.io"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
