lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'helio/version'

Gem::Specification.new do |s|
  s.name     = "helio"
  s.version  = Helio::VERSION
  s.authors  = ["Paul Jovanovic"]
  s.email    = 'paul@superjova.com'
  s.summary  = "Superjova CSS Framework"
  s.homepage = "https://github.com/superjova/helio"
  s.license  = 'MIT'

  s.add_runtime_dependency 'sass', '>= 3.2.19'
  s.add_runtime_dependency 'autoprefixer-rails', '>= 5.0.0.1'

  # Dummy Rails app dependencies
  s.add_development_dependency 'actionpack', '>= 4.1.5'
  s.add_development_dependency 'activesupport', '>= 4.1.5'
  s.add_development_dependency 'sprockets-rails', '>= 2.1.3'
  s.add_development_dependency 'slim-rails'
  s.add_development_dependency 'uglifier'
  # Converter
  s.add_development_dependency 'term-ansicolor'

  s.files      = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- test/*`.split("\n")
end
