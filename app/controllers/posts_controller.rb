class PostsController < ApplicationController

before_action :is_authenticated?
# def show
#   @post = Post.new
#   @posts = Post.where(user_id: @current_user)
# end

def index
  @vote = Vote.new
  @posts = Post.all
  respond_to do |format|
    format.json{ render json:@posts }
    format.xml{ render xml:@posts }
    format.html
  end
end


def new
  @post = Post.new
end

def create
  @post = current_user.posts.create(post_params)
  if @post.save
    flash[:success] = "New Post Created"
    redirect_to root_path
  else
    flash[:danger] = "Post failed"
    render :new
  end

end

def show
 @post = Post.find(params[:id])
 @comments = Comment.all
end

end


  private


def post_params
  params.require(:post).permit(:title,:link)
end


def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
