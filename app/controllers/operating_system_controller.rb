class OperatingSystemController < ApplicationController

  get :'/operating_systems' do
    @os = OperatingSystem.all
    erb :"operating_systems/index"
  end

  get :'/operating_systems/:id' do
    @os = OperatingSystem.find_by(id: params[:id])

    erb :'/operating_systems/show'
  end

end
