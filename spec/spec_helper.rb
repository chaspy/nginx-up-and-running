require 'rspec/json_matcher'
require 'infrataster/rspec'

RSpec.configuration.include RSpec::JsonMatcher
Infrataster::Server.define(
  :proxy,           # name
  '13.231.128.64', # proxy VM's IP address
      )
