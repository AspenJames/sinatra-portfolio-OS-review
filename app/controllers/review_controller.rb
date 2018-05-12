class ReviewController < ApplicationController

  get '/reviews/new' do
    @os = OperatingSystem.all
    @user = Helper.current_user(session)

    erb :'/reviews/new'
  end

  post '/reviews' do
    review = Review.create(params["review"])
    review.operating_system = OperatingSystem.create(params["os"]) unless params["os"]["name"].empty?
    redirect :"/reviews#{review.id}"
  end

end
