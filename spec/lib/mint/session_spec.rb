require 'spec_helper'

describe Mint::Session do
  describe '#create!' do
    let(:session) { Mint::Session.new }

    context 'error in response' do
      let(:response) { '{"error": {"the_system": "is_down"}}' }

      before { allow(session).to receive(:request).and_return(response) }

      it 'raises an exception' do
        expect { session.create! }.to raise_error '{"the_system"=>"is_down"}'
      end
    end
  end
end
