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
  s.test_files  = Dir['spec/**/*']

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.2'

  s.add_dependency 'rails-i18n'
  s.add_dependency 'kaminari'
  s.add_dependency 'kaminari-i18n', '~> 0.4.0'
  s.add_dependency 'turbolinks', '~> 5.0.0'
  s.add_dependency 'jquery-rails', '~> 4.3.1'
  s.add_dependency 'bootstrap-sass', '~> 3.3.6'
  s.add_dependency 'sass-rails', '>= 3.2'
  s.add_dependency 'font-awesome-rails', '~> 4.7.0.2'
  s.add_dependency 'icheck-rails', '~> 1.0'
  s.add_dependency 'bootstrap-wysihtml5-rails', '~> 0.3.3.8'
  s.add_dependency 'jstree-rails-4'
  s.add_dependency 'toastr-rails'

  s.add_dependency 'emoji_flag'
  s.add_dependency 'json_translate'
  s.add_dependency 'devise', '~> 4.3.0'
  s.add_dependency 'simple_form', '~> 3.5.0'
  s.add_dependency 'friendly_id', '~> 5.2.1'
  s.add_dependency 'state_machines-activerecord', '~> 0.5.0'
  s.add_dependency 'awesome_nested_set'
  s.add_dependency 'jbuilder', '~> 2.7.0'

  s.add_development_dependency 'pg', '~> 0.21.0'
  s.add_development_dependency 'rspec-rails', '~> 3.6.0'
  s.add_development_dependency 'capybara', '~> 2.14.4'
  s.add_development_dependency 'factory_girl_rails', '~> 4.8.0'
  s.add_development_dependency 'faker', '~> 1.8.4'
  s.add_development_dependency 'rails-controller-testing', '~> 1.0.2'
  s.add_development_dependency 'byebug', '~> 9.0.6'
  s.add_development_dependency 'puma', '~> 3.9.1'
  s.add_development_dependency 'rubocop-rails', '~> 1.0.1'
  s.add_development_dependency 'simplecov', '~> 0.15.0'
  s.add_development_dependency 'poltergeist', '~> 1.16.0'
end
