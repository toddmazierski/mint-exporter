module Mint
  class Transaction
    URL = "#{Mint::URL}/transactionDownload.event"

    attr_reader :session

    def initialize(session)
      @session = session
    end

    def fetch
      request_until_valid
    end

    private

      # A workaround for this bug:
      #   https://github.com/toddmazierski/mint-exporter/issues/6
      def request_until_valid
        wait = Wait.new(attempts: 10, delay: 5)

        wait.until do
          response = request
          valid?(response) ? response : next
        end
      end

      def request
        RestClient.get(URL, session.params)
      end

      def valid?(response)
        response.headers[:content_type].include?('text/csv')
      end
  end
end
