require "uri"
require "bundler/setup"
Bundler.require

hostname = "https://wwws.mint.com/"

unless ARGV.length == 2
  puts "Usage: ruby #{$0} USERNAME PASSWORD"
  exit 1
end

username = ARGV[0]
password = ARGV[1]

session = Capybara::Session.new(:webkit)

session.visit(URI.join hostname, "/login.event")
session.within(:xpath, "//form[@id='form-login']") do
  session.fill_in("form-login-username", with: username)
  session.fill_in("form-login-password", with: password)
end
session.click_button("submit")
sleep 2

session.visit(URI.join hostname, "/transactionDownload.event")
until (session.source.include?"Original Description") do
  sleep 1
end

puts session.source
