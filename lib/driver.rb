class Driver
  NAME = :poltergeist

  # Configures Capybara to use PhantomJS/Poltergeist.
  def self.configure
    Capybara.run_server = false
    register
    Capybara.current_driver = NAME
  end

  def self.register
    Capybara.register_driver(NAME) do |app|
      Capybara::Poltergeist::Driver.new(app, options)
    end
  end

  def self.options
    {
      :phantomjs => Phantomjs.path,
      # Do not raise Ruby exceptions when JavaScript errors occur.
      :js_errors => false,
      # Suppress "ran insecure content" warnings from PhantomJS.
      :phantomjs_logger => File.open('/dev/null')
    }
  end
end
