module Mint
  class Session
    URL = "#{Mint::URL}/loginUserSubmit.xevent"

    def create!
      response = request

      error = JSON.parse(response)['error']
      raise(error) if error

      @cookies = response.cookies
    end

    def params
      {cookies: cookies}
    end

    private

      attr_reader :cookies

      def request
        params = {
          username: Mint.config.username,
          password: Mint.config.password,
          task:     'L'
        }

        RestClient.post(URL, params, accept: :json)
      end
  end
end
