require 'yaml'
require 'open-uri'
require 'json'
require 'mechanize'
require 'uri'
require 'os'
require_relative 'kabe'
require_relative 'source_factory'

config_file = YAML.load_file File.dirname(__FILE__)+'/../config/kabe_setting.yaml'
client = Kabe.new config: config_file
client.init
