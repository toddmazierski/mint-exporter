module Mint
  class Client
    def transactions
      Mint::Transaction.new(session)
    end

    private

      def session
        @session ||= Mint::Session.new.tap(&:create!)
      end
  end
end
