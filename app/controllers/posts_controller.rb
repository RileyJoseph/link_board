class PostsController < ApplicationController


# def show
#   @post = Post.new
#   @posts = Post.where(user_id: @current_user)
# end

def index
  @post = Post.new
  @posts = Post.where(user_id: @current_user)
end


def new

end

def create
  @post = current_user.posts.create(post_params)
  redirect_to root_path
end


end





  private


  def post_params
    params.require(:post).permit(:title,:link)
  end


    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
