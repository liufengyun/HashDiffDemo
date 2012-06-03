# Load the rails application
require File.expand_path('../application', __FILE__)

CONFIG = Hashie::Mash.new YAML.load_file(Rails.root.join("config", "config.yml"))[Rails.env]

# Initialize the rails application
Diff::Application.initialize!
