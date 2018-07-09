require 'rspec/json_matcher'
require 'infrataster/rspec'
require_relative 'spec_hosts'

RSpec.configuration.include RSpec::JsonMatcher
Infrataster::Server.define(
  :nginx,           # name
  $nginx_ip, # proxy VM's IP address
      )
