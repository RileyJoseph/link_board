class CommentsController < ApplicationController

def index
  @comments = Comment.all
  @post = Post.find(params[:post_id])
  # render :json => params
end

def new
  @vote = Vote.new
  @comment = Comment.new
  @post = Post.find(params[:post_id])
  # render :json => params
end

def create
  @post = Post.find(params[:post_id])
  @comment = @post.comments.create(comment_params)
  @comment.user_id = current_user.id
  if @comment.save
    redirect_to new_post_comment_path
  else
    flash.now[:danger] = "error"
  end
end


private

  def comment_params
    params.require(:comment).permit(:body)
  end


end