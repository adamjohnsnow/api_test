require 'sinatra/base'

class ThermostatApi < Sinatra::Base
  get '/thermostat' do
    erb(:thermostat)
  end
end
