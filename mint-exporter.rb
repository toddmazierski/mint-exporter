require 'bundler/setup'
Bundler.require

require_relative 'lib/credentials'
require_relative 'lib/mint'

credentials = Credentials.new
credentials.validate!

mint = Mint.new(credentials)
mint.authenticate
puts mint.csv
