$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'cdx/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'cdx'
  s.version     = Cdx::VERSION
  s.authors     = ['Alexandre Ferraille']
  s.email       = ['alexandre.ferraille@opsone.net']
  s.homepage    = ''
  s.summary     = 'Summary of Cdx.'
  s.description = 'Description of Cdx.'
  s.license     = 'MIT'
  s.test_files = Dir['spec/**/*']

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.2'

  s.add_dependency 'bootstrap-sass', '~> 3.3.6'
  s.add_dependency 'sass-rails', '>= 3.2'

  s.add_development_dependency 'pg'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
end
