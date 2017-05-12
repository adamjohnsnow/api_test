require 'sinatra/base'

class ThermostatApi < Sinatra::Base
  get '/' do
    erb(:thermostat)
  end
end
