require 'spec_helper'

describe Mint do
  describe '.configure' do
    let(:username) { 'test@example.org' }
    let(:password) { '123456' }

    it 'assigns username' do
      Mint.configure { |config| config.username = username }

      expect(Mint.config.username).to eq(username)
    end

    it 'assigns password' do
      Mint.configure { |config| config.password = password }

      expect(Mint.config.password).to eq(password)
    end
  end
end
