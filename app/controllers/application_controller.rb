require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Basidiomycota"
    use Rack::Flash
  end

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do

  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    
  end

  get '/logout' do
    session.clear
    redirect :'/'
  end

end
