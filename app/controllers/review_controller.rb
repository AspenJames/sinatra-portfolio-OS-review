class ReviewController < ApplicationController

  get '/reviews' do
    if Helper.logged_in?(session)
      @reviews = Review.all
      @user = Helper.current_user(session)
      erb :'/reviews/index'
    else
      redirect :'/login'
    end
  end

  get '/reviews/new' do
    if Helper.logged_in?(session)
      @os = OperatingSystem.all
      @user = Helper.current_user(session)
      erb :'/reviews/new'
    else
      redirect :'/login'
    end
  end

  post '/reviews' do
    review = Review.create(params["review"])
    review.build_operating_system(params["os"]) unless params["os"]["name"].empty?
    review.save
    redirect :"/reviews/#{review.id}"
  end

  get '/reviews/:id' do
    if Helper.logged_in?(session)
      @review = Review.find_by(id: params[:id])
      erb :'/reviews/show'
    else
      redirect :'/login'
    end
  end

  get '/reviews/:id/edit' do
    @review = Review.find_by(id: params[:id])
    if Helper.logged_in?(session) && Helper.current_user(session) == @review.user
      @OS = OperatingSystem.all
      erb :"/reviews/edit"
    elsif Helper.logged_in?(session)
      flash[:message] = "You cannot edit another user's review!"
      redirect :"/reviews/#{@review.id}"
    else
      redirect :'/login'
    end
  end

  patch '/reviews/:id' do
    @review = Review.find_by(id: params[:id])
    if Helper.current_user(session) == @review.user
      @review.update(params["review"])
      @review.build_operating_system(params["os"]) unless params["os"]["name"].empty?
      if @review.save
        flash[:message] = "Successfully edited your review!"
      end

      redirect :"/reviews/#{@review.id}"
    else
      flash[:message] = "You cannot edit another user's review!"
      redirect :"/reviews/#{@review.id}"
    end
  end

  get '/reviews/:id/delete' do
    @review = Review.find_by(id: params[:id])
    if Helper.logged_in?(session) && Helper.current_user(session) == @review.user
      erb :'/reviews/delete'
    elsif Helper.logged_in?(session)
      flash[:message] = "You cannot delete another user's review!"
      redirect :"/reviews/#{@review.id}"
    else
      redirect :'/login'
    end
  end

  post '/reviews/:id/delete' do
    if Helper.current_user(session) == @user.id
      @review = Review.find_by(id: params[:id])
      @review.destroy
      flash[:message] = "Successfully deleted your review"

      redirect :'/reviews'
    else
      flash[:message] = "You cannot delete another user's review!"
      redirect :"/reviews/#{@review.id}"
    end
  end

end
