$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'alpha_card/version'

Gem::Specification.new do |gem|
  gem.name = 'alpha_card'
  gem.version = AlphaCard.gem_version
  gem.date = '2017-08-11'
  gem.summary = 'Alpha Card Services API for Ruby'
  gem.description = 'Gem for creating sales with Alpha Card Services'
  gem.authors = ['Nikita Bulai']
  gem.email = 'bulajnikita@gmail.com'
  gem.require_paths = ['lib']
  gem.files = `git ls-files`.split($RS)
  gem.homepage = 'http://github.com/nbulaj/alpha_card'
  gem.license = 'MIT'
  gem.required_ruby_version = '>= 2.2.2'

  gem.add_runtime_dependency 'rack', '>= 1.6'

  gem.add_development_dependency 'rspec', '~> 3.5'
end
