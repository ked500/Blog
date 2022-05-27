class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @microposts = @user.microposts.paginate(page: params[:page])
    else
      flash[:danger] = "This user disappeared!"
      redirect_to root_url
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
