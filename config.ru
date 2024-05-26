# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server

require 'cloudinary'

Cloudinary.config_from_url("cloudinary://861615756761388:RDshVJNdwOeUh1mur3bnfss5FqY@dovuhpq16")
Cloudinary.config do |config|
  config.secure = true
end
