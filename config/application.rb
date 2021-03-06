require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lodge
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # config.time_zone = 'Berlin'
    config.i18n.default_locale = :de
    config.i18n.locale = :de
    config.generators do |g|
      g.javascript_engine :js
    end
  end
end
