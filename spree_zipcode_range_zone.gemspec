# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_zipcode_range_zone'
  s.version     = '0.0.1'
  s.summary     = 'Adds zip code range zoneale types to Spree'
  s.description = 'Adds zip code range zoneale types to Spree'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Mike Farmer'
  s.email     = 'mike.farmer@gmail.com'
  s.homepage  = 'http://github.com/mikefarmer'

  s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.1.0'

  s.add_development_dependency 'capybara', '~> 2.0'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
