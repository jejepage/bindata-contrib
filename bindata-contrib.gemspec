require_relative 'lib/bindata-contrib/version'

Gem::Specification.new do |s|
  s.name         = 'bindata-contrib'
  s.version      = BinData::Contrib::VERSION
  s.authors      = ['Jérémy Pagé']
  s.email        = ['contact@jeremypage.me']
  s.summary      = 'BinData Contrib'
  s.description  = 'Contribution to BinData.'

  s.files        = `git ls-files lib`.split("\n")
  s.test_files   = `git ls-files spec`.split("\n")
  s.require_path = 'lib'

  s.homepage     = 'https://github.com/jejepage/bindata-contrib'
  s.license      = 'MIT'

  s.add_runtime_dependency 'bindata', '~> 2.1'
  s.add_development_dependency 'rspec', '~> 3.2'
end
