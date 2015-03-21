require 'spec_helper'
require 'csv'

describe Mint::Client do
  describe '#transaction', vcr: {match_requests_on: %i(method uri body headers)} do
    before do
      Mint.configure do |config|
        config.username = 'test@example.org'
        config.password = '123456'
      end
    end

    let(:client) { Mint::Client.new }

    let(:actual_transactions) do
      CSV.parse(client.transactions.fetch)
    end

    let(:expected_transactions) do
      [
        ['Date', 'Description', 'Original Description', 'Amount', 'Transaction Type', 'Category', 'Account Name', 'Labels', 'Notes'],
        ['5/01/2009', 'homestarrunner.com', 'FLUFFY PUFF MARSHMALLOWS', '11.99', 'debit', 'Junk Food', 'QuesoCard', '', '']
      ]
    end

    it 'returns transactions' do
      expect(actual_transactions).to eq(expected_transactions)
    end
  end
end
