class MintExporter
  include Capybara::DSL

  BASE_URL = 'https://wwws.mint.com/'
  LOGIN_URI = URI.join(BASE_URL, '/login.event')
  CSV_URI = URI.join(BASE_URL, '/transactionDownload.event')

  # The presence of this cookie indicates that logging in was successful.
  LOGGED_IN_COOKIE = 'userguid'
  # These cookies are required to download the transactions CSV.
  CSV_COOKIES = ['JSESSIONID', 'mintPN']

  def initialize(credentials)
    @credentials = credentials
    log_in
  end

  # Returns the Mint transactions CSV.
  def csv
    csv_cookies = cookies.values_at(*CSV_COOKIES)
    cookie_header = cookie_header(csv_cookies)

    open(CSV_URI, 'Cookie' => cookie_header).read
  end

private

  # Logs into Mint. Blocks execution until successful.
  def log_in
    visit LOGIN_URI

    within('#form-login') do
      fill_in 'email', :with => @credentials.username
      fill_in 'password', :with => @credentials.password
      click_button('submit')
    end

    wait = Wait.new
    wait.until { cookies.keys.include?(LOGGED_IN_COOKIE) }
  end

  # Given a hash of cookie objects, returns a single "Cookie" header string.
  def cookie_header(cookies)
    cookies.map { |cookie| [cookie.name, cookie.value].join('=') }.join('; ')
  end

  def cookies
    page.driver.cookies
  end
end
