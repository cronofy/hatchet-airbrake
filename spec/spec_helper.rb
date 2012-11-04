require_relative '../lib/hatchet_airbrake'
require 'rspec'

RSpec.configure do |config|
  config.color_enabled = true
end

def random_string
  (0...24).map{ ('a'..'z').to_a[rand(26)] }.join
end