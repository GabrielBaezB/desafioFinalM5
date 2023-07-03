class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]
  def load_more_tweets
    @tweets = Tweet.offset(params[:offset]).limit(10)
    respond_to do |format|
      format.js
    end
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
    puts @tweet.inspect
  end
  
  def index
    @tweets = if params[:search]
      Tweet.where("description ILIKE ?", "%#{params[:search]}%").page(params[:page]).per(10)
    else
      Tweet.page(params[:page]).per(10)
    end
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.userAvatar = Faker::Avatar.image
    if @tweet.save
      redirect_to @tweet, notice: "Tweet was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: "Tweet was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: "Tweet was successfully destroyed."
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:description, :UserName)
  end
end
