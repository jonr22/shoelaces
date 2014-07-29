# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'shoelaces/version'
require 'date'

Gem::Specification.new do |s|
  s.required_ruby_version = ">= #{Shoelaces::RUBY_VERSION}"
  s.authors = ['jonr22', 'thoughtbot']
  s.date = Date.today.strftime('%Y-%m-%d')

  s.description = <<-HERE
Shoelaces is a base Rails project that you can upgrade. It has been forked from
thoughtbot's Suspenders.

Use Shoelaces if you love Suspenders but want to use bootstrap instead of bourbon.

Modified to use bootstrap instead of bourbon.

Changes from Suspenders:
  - added bootstrap
  - added guard
  - added default layout
  - added simple form installation (w/ bootstrap)
  - added pow to setup script
  - added custom port configuration (use Sholeaces [app name] -P [port number])
  - added paperclip
  - removed shared javascripts
  - removed bourbon, bitters, and neat
  - removed flutie

  HERE

  s.email = 'jonr2219@gmail.com'
  s.executables = ['shoelaces']
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/jonr22/shoelaces'
  s.license = 'MIT'
  s.name = 'shoelaces'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.summary = "Generate a Rails app using best practices."
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Shoelaces::VERSION

  s.add_dependency 'bundler', '~> 1.3'
  s.add_dependency 'rails', Shoelaces::RAILS_VERSION

  s.add_development_dependency 'aruba', '~> 0.5'
  s.add_development_dependency 'cucumber', '~> 1.2'
  s.add_development_dependency 'rspec', '~> 2.0'
  s.add_development_dependency 'capybara', '~> 2.2', '>= 2.2.0'
end
