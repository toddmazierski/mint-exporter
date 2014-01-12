require "uri"
require 'open-uri'
require "bundler/setup"
Bundler.require

hostname = "https://wwws.mint.com/"

unless ARGV.length == 2
  puts "Usage: ruby #{$0} USERNAME PASSWORD"
  exit 1
end

username = ARGV[0]
password = ARGV[1]

Capybara.run_server = false

Capybara.register_driver(:poltergeist) do |app|
  Capybara::Poltergeist::Driver.new(app, {
    :phantomjs => Phantomjs.path,
    :js_errors => false,
    :phantomjs_logger => File.open('/dev/null')
  })
end

session = Capybara::Session.new(:poltergeist)

session.visit(URI.join hostname, "/login.event")
session.within(:xpath, "//form[@id='form-login']") do
  session.fill_in("form-login-username", with: username)
  session.fill_in("form-login-password", with: password)
end
session.click_button("submit")
sleep 2

cookies = session.driver.cookies.values_at('JSESSIONID', 'mintPN')
cookies = cookies.map { |cookie| [cookie.name, cookie.value].join('=') }.join('; ')
puts open('https://wwws.mint.com/transactionDownload.event', 'Cookie' => cookies).read
