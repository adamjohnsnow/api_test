require 'sinatra/base'
require 'json'

class ThermostatApi < Sinatra::Base
  get '/thermostat' do
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    content_type :json
    File.read('views/thermostat.json')
  end

  get '/captcha' do
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    content_type :json
    File.read('views/captcha.json')
  end

  post '/save_thermostat' do
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST'
    jsonHash = {
      "temperature" => params["temperature"].to_i,
      "powerSave" => is_true?(params["powerSave"])
    }
    file = File.open("views/thermostat.json","w")
    file.write(jsonHash.to_json)
    file.close
  end

  def is_true?(string)
    string == "true"
  end

end
