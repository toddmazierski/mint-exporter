class Mint
  class AuthenticationError < StandardError; end

  BASE_URL  = 'https://wwws.mint.com'
  LOGIN_URL = "#{BASE_URL}/loginUserSubmit.xevent"
  CSV_URL   = "#{BASE_URL}/transactionDownload.event"

  def initialize(credentials)
    @credentials = credentials
  end

  # Authenticates with Mint:
  #
  #   * If successful, assigns the cookies returned to an instance variable
  #   * If an error is detected, raises an +AuthenticationError+ exception
  #
  def authenticate
    payload = {
      :username => @credentials.username,
      :password => @credentials.password,
      :task     => 'L'
    }
    response = RestClient.post(LOGIN_URL, payload, {:accept => :json})
    error = JSON.parse(response)['error']
    raise(AuthenticationError, error) if error
    @cookies = response.cookies
  end

  # Returns the Mint transactions CSV.
  def csv
    RestClient.get(CSV_URL, :cookies => @cookies)
  end

  # A (hopefully) temporary workaround for bug #6:
  #
  #   https://github.com/toddmazierski/mint-exporter/issues/6
  #
  # Attempts to download the CSV up to 10 times, pausing for 5 seconds between
  # each attempt.
  def csv_with_bug_6_workaround
    wait = Wait.new(
      :attempts => 10,
      :timeout  => 60,
      :delay    => 5,
      :rescue   => RestClient::ResourceNotFound
    )

    wait.until { csv }
  end
end
