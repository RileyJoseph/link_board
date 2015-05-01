class VotesController < ApplicationController


def create
  if params.key?(:post_id)
    thing = Post.find_by_id(params[:post_id])
  elsif params.key?(:user_id)
    thing = User.find_by_id(params[:user_id])
  elsif params.key?(:comment_id)
    thing = Comment.find_by_id(params[:comment_id])
  else
    return render plain: "You're doing something stupid"
  end

  my_vote = thing.votes.find_by_user_id(current_user.id)

  if my_vote.nil?
    current_user.ratings << thing.votes.create(vote_params)
  else
    if (params[:vote][:value].to_i != my_vote.value)
      my_vote.value=params[:vote][:value]
      my_vote.save
    else
      flash[:danger] = "You already voted!"
    end
  end

# respond_to do |format|
#   format.json { render json:{result:true, votes:thing.votes}}
#   format.html {redirect_to :posts}
# end

if params.key?(:comment_id)
      thing = Comment.find_by_id(params[:comment_id])
    redirect_to new_post_comment_path(thing)
  elsif params.key?(:post_id)
    redirect_to :posts
  else
    redirect_to :posts
  end
end

private

  def vote_params
    params.require(:vote).permit(:value)
  end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end