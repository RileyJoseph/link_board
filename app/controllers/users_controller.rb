class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      flash[:success]='Signup Successful!'
      redirect_to root_path
      # Handle a successful save.
  else
    flash[:danger]='Signup Failed!'
    render 'new'
  end
end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end

