require 'sinatra/base'
require 'json'

class ThermostatApi < Sinatra::Base
  get '/thermostat' do
    content_type :json
    File.read('views/thermostat.json')
  end
end
