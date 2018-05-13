class ReviewController < ApplicationController

  get '/reviews' do
    @reviews = Review.all
    @user = Helper.current_user(session)
    erb :'/reviews/index'
  end

  get '/reviews/new' do
    @os = OperatingSystem.all
    @user = Helper.current_user(session)

    erb :'/reviews/new'
  end

  post '/reviews' do
    review = Review.create(params["review"])
    review.build_operating_system(params["os"]) unless params["os"]["name"].empty?
    review.save
    binding.pry
    redirect :"/reviews/#{review.id}"
  end

  get '/reviews/:id' do
    @review = Review.find_by(id: params[:id])
    erb :'/reviews/show'
  end

  get '/reviews/:id/edit' do
    @review = Review.find_by(id: params[:id])
    @OS = OperatingSystem.all
    erb :"/reviews/edit"
  end

  patch '/reviews/:id' do
    @review = Review.find_by(id: params[:id])

    @review.update(params["review"])
    @review.build_operating_system(params["os"]) unless params["os"]["name"].empty?
    if @review.save
      flash[:message] = "Successfully edited your review!"
    end

    redirect :"/reviews/#{@review.id}"
  end

  get '/reviews/:id/delete' do
    @review = Review.find_by(id: params[:id])

    erb :'/reviews/delete'
  end

  post '/reviews/:id/delete' do
    @review = Review.find_by(id: params[:id])
    @review.destroy
    flash[:message] = "Successfully deleted your review"

    redirect :'/reviews'
  end

end
