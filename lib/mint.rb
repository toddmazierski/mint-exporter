require 'dotenv'
require 'rest-client'
require 'wait'

Dotenv.load

require_relative 'mint/config'

module Mint
  URL = 'https://wwws.mint.com'

  class << self; attr_reader :config; end
  @config = Mint::Config.new

  def self.configure
    yield(config)
  end
end

require_relative 'mint/client'
require_relative 'mint/session'
require_relative 'mint/transaction'
