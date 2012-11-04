$:.push File.expand_path("../lib", __FILE__)
require "hatchet_airbrake/version"

Gem::Specification.new do |s|
  s.name        = "hatchet-airbrake"
  s.version     = HatchetAirbrake::VERSION.dup
  s.platform    = Gem::Platform::RUBY 
  s.summary     = "Hatchet appender for posting errors to airbrake"
  s.email       = "adam.bird@gmail.com"
  s.homepage    = "http://github.com/adambird/hatchet-airbrake"
  s.description = "Hatchet appender for posting errors to airbrake"
  s.authors     = ['Adam Bird']

  s.files         = Dir["lib/**/*"]
  s.test_files    = Dir["spec/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency('airbrake', '~> 3.1.6')
  s.add_dependency('hatchet', '~> 0.0.17')
end