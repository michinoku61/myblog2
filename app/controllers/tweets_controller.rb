class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.page(params[:page]).per(5).order("id DESC")
  end

  def new
  end

  def create
    @tweet = Tweet.create(tweet_params)
  end

  private
  def tweet_params
    params.permit(:name, :text)
    
  end
end
