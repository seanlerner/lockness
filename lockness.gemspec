lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'lockness/version'

Gem::Specification.new do |spec|
  spec.name                              = 'lockness'
  spec.authors                           = ['Sean Lerner']
  spec.email                             = ['sean@@smallcity.ca']
  spec.files                             = `git ls-files`.split.reject { |f| f.match('test') }
  spec.homepage                          = 'https://github.com/seanlerner/lockness'
  spec.license                           = 'MIT'
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.require_paths                     = ['lib']
  spec.summary                           = 'Manage encrypted secrets'
  spec.version                           = Lockness::VERSION
  spec.executables                      << 'lockness'

  spec.add_dependency 'activesupport', '~> 7.0'

  spec.add_development_dependency 'bundler',             '~> 2.3'
  spec.add_development_dependency 'interesting_methods', '~> 0.1'
  spec.add_development_dependency 'minitest',            '~> 5.15'
  spec.add_development_dependency 'pry',                 '~> 0.14'
  spec.add_development_dependency 'rake',                '~> 13.0'
  spec.add_development_dependency 'rubocop',             '~> 1.30'
  spec.add_development_dependency 'rubocop-minitest',    '~> 0.20'
  spec.add_development_dependency 'rubocop-rake',        '~> 0.6'
end
