require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Lemmoney
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators do |g|
      g.template_engine :slim
    end
  end
end
