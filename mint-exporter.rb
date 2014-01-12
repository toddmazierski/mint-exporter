require 'uri'
require 'open-uri'
require 'bundler/setup'
Bundler.require

require_relative 'lib/credentials'
require_relative 'lib/driver'
require_relative 'lib/mint_exporter'

credentials = Credentials.new
credentials.validate!

Driver.configure

mint_exporter = MintExporter.new(credentials)
puts mint_exporter.csv
