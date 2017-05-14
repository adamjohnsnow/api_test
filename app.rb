require 'sinatra/base'
require 'json'

class ThermostatApi < Sinatra::Base
  get '/thermostat' do
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    content_type :json
    File.read('views/thermostat.json')
  end

  get '/save_thermostat' do
    p params
    jsonHash = {
      "temperature" => params["temperature"].to_i,
      "powerSave" => is_true?(params["powerSave"])
    }
    File.open("views/thermostat.json","w") do |f|
      f.write(jsonHash.to_json)
    end
  end

  def is_true?(string)
    string == "true"
  end

end
