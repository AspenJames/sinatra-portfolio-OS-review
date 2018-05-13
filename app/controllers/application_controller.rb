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
    if Helper.logged_in?(session)
      redirect :'/reviews'
    else
      erb :login
    end
  end

  post '/login' do
    if @user = User.find_by(username: params["username"])
      if @user.authenticate(params["password"])
        session[:user_id] = @user.id
        flash[:message] = "Successfully logged in!"
        redirect :'/'
      end
    else
      flash[:message] = "Incorrect username and/or password."
      redirect :'/login'
    end
  end

  get '/signup' do
    if Helper.logged_in?(session)
      redirect :'/reviews'
    else
      erb :signup
    end
  end

  post '/signup' do
    if params.any?{|p| p.empty?}
      flash[:message] = "All fields are required!"
      redirect :'/signup'
    elsif params["password"] != params["pwrd_verify"]
      flash[:message] = "Your password fields did not match, please try again."
      redirect :'/signup'
    else
      @user = User.create(name: params["name"], username: params["username"], email: params["email"], password: params["password"])
      session[:user_id] = @user.id
      redirect :'/'
    end
  end

  get '/logout' do
    session.clear
    flash[:message] = "Successfully logged out."
    redirect :'/'
  end

end
