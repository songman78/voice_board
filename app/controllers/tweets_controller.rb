class TweetsController < ApplicationController
  before_action :set_tweet,only: [:edit, :show]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").first(5)
    
    # @unsolved_tweet = Tweet.where(check_id:1)
    # @solution_tweet = Tweet.where(check_id:2)
    
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if  @tweet.save
      render :create
    else
     render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:name,:file, :text, :check_id).merge(user_id:current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
 
end
