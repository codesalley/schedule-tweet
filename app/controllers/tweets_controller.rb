class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]
  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Current.user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice:  'Your tweet has been scheduled'

    else
      render :new
    end
  end
  def edit
    render plain: 'hello'
  end
  def show

  end
  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Tweet was updated successfully"
    else
      render :edit
    end
  end
  def destroy

  end
  private

  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body , :publish_at)
  end
  def set_tweet
    @tweet = Current.user.tweets.find(params[:id])
  end
end