# Load the rails application
require File.expand_path('../application', __FILE__)

#APP_CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), "/app_config.yml"))

# Initialize the rails application
Journaly::Application.initialize!
