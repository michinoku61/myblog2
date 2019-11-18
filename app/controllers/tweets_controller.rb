class TweetsController < ApplicationController
  before_action :go_index, except: :index
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("id DESC")
  end

  def new
  end

  def create
    @tweet = Tweet.create(text: tweet_params[:text], user_id: current_user.id)
  end

  private
  def tweet_params
    params.permit(:text, :user_id)
  end

  def go_index
    redirect_to action: :index unless user_signed_in?
  end
end
