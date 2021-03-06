require_relative 'boot'

require 'rails/all'

require 'log4r'
require 'log4r/yamlconfigurator'
require 'log4r/outputter/datefileoutputter'
include Log4r
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RefernzApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #config for adding the fonts folder to the asset pipeline structure
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    #config for adding lib to load
    config.autoload_paths << "#{Rails.root}/lib"

    # assign log4r's logger as rails' logger.
    log4r_config= YAML.load_file(File.join(File.dirname(__FILE__),"log4r.yml"))
    YamlConfigurator.decode_yaml( log4r_config['log4r_config'] )
    config.logger = Log4r::Logger[Rails.env]

    config.before_configuration do
        env_file = File.join(Rails.root,  'local_env.yml')
        YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
          end if File.exists?(env_file)
    end
  end
end
