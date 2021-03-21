class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    redirect_to "/tweets/#{@comment.tweet.id}" 
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
