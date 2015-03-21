require 'mint'

Mint.configure do |config|
  config.username = ENV.fetch('MINT_USERNAME')
  config.password = ENV.fetch('MINT_PASSWORD')
end

client = Mint::Client.new
puts client.transactions.fetch
