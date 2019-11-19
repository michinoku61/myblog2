class TweetsController < ApplicationController
  before_action :go_index, except: [:index, :show]
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("id DESC")
  end

  def new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = Tweet.create(text: tweet_params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
    redirect_to action: :index
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(update_params)
    end
    redirect_to root_path
  end


  private
  def tweet_params
    params.permit(:text)
  end

  def update_params
    params.require(:tweet).permit(:text)
  end

  def go_index
    redirect_to action: :index unless user_signed_in?
  end
end
