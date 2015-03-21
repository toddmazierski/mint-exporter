# mint-exporter

Regularly export your Mint.com transactions.

<img src='https://api.travis-ci.org/toddmazierski/mint-exporter.svg' alt='Travis CI badge' />

## Installation

### As a :floppy_disk: standalone utility :floppy_disk:

  1. Clone this repository:

  ```shell
  git clone git://github.com/toddmazierski/mint-exporter.git
  cd mint-exporter
  ```

  2. Rename `.env.example` to `.env` and fill in your Mint credentials

  ```shell
  cp .env.example .env
  ```

  3. Install dependencies with Bundler:

  ```shell
  bundle
  ```

  4. Run the exporter script:

  ```shell
  bundle exec ruby mint-exporter.rb > transactions.csv
  ```

### As a :gem: gem :gem:

  1. Add to your `Gemfile`:

  ```ruby
  gem 'mint', git: 'git://github.com/toddmazierski/mint-exporter.git'
  ```

  2. Add an initializer:

  ```ruby
  # config/initializers/mint.rb

  Mint.configure do |config|
    config.username = ENV.fetch('MINT_USERNAME')
    config.password = ENV.fetch('MINT_PASSWORD')
  end
  ```

  3. To output transactions:

  ```ruby
  client = Mint::Client.new
  puts client.transactions.fetch
  ```

## :warning: Warning :warning:

Unfortunately, [because Mint.com does not yet have an open API](http://www.quora.com/Mint-com/Does-Mint-com-have-an-open-API?share=1), mint-exporter relies on private APIs to get the data. Because of this, this library has ([example](https://github.com/toddmazierski/mint-exporter/issues/6)) and will continue to occasionally break! **Not recommended for production use.**
