Gem::Specification.new('mint', '0.0.1') do |spec|
  spec.authors  = ['Todd Mazierski']
  spec.email    = ['todd@generalassemb.ly']
  spec.homepage = 'https://github.com/toddmazierski/mint-exporter'
  spec.summary  = 'Regularly export your Mint.com transactions'
  spec.files    =  Dir['lib/**/*']

  spec.add_runtime_dependency 'dotenv', '~> 0.9'
  spec.add_runtime_dependency 'rest-client', '~> 1.7'
  spec.add_runtime_dependency 'wait', '~> 0.5'

  spec.add_development_dependency 'rspec', '3.1.0'
  spec.add_development_dependency 'pry', '0.10.1'
  spec.add_development_dependency 'webmock', '~> 1.20'
  spec.add_development_dependency 'vcr', '~> 2.9'
end
