class UserController < Sinatra::Base

  get '/users' do
    if Helper.logged_in?(session)
      @users = User.all
      erb :'/users/index'
    else
      redirect :'/'
    end
  end

  get '/users/:slug' do
    if Helper.logged_in?(session)
      @user = User.find_by_slug(params[:slug])
      erb :'/users/show'
    else
      redirect :'/'
    end
  end

end
