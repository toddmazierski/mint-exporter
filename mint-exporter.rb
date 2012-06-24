require "uri"
require "rubygems"
require "bundler/setup"
Bundler.require

hostname = "https://wwws.mint.com/"

unless ARGV.length == 2
  puts "Usage: ruby #{$0} USERNAME PASSWORD"
  exit 1
end

username = ARGV[0]
password = ARGV[1]

agent = Mechanize.new
agent.pluggable_parser.default = Mechanize::Download

page  = agent.get(URI.join hostname, "/login.event")
form = page.form_with(:id => "form-login")

form.username = username
form.password = password
form.submit

puts agent.get(URI.join hostname, "/transactionDownload.event").body
