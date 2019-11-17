class TweetsController < ApplicationController
  before_action :go_index, except: :index
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

  def go_index
    redirect_to action: :index unless user_signed_in?
  end
end
