class OperatingSystemController < ApplicationController

  get '/operating_systems' do
    if Helper.logged_in?(session)
      @os = OperatingSystem.all
      erb :"/operating_systems/index"
    else
      redirect :'/login'
    end
  end

  get '/operating_systems/:id' do
    if Helper.logged_in?(session)
      @os = OperatingSystem.find_by(id: params[:id])
      erb :'/operating_systems/show'
    else
      redirect :'/login'
    end
  end

end
