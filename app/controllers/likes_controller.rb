class LikesController < ApplicationController
  before_action :find_micropost
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "you already liked this"
    else
      @micropost.likes.create(user_id: current_user.id)
    end
    redirect_to micropost_path(@micropost)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "you can not unlike this"
    else
      @like.destroy
    end
    redirect_to micropost_path(@micropost)
  end

  private
  def find_like
    @like = @micropost.likes.find(params[:id])
  end

  def find_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, micropost_id: params[:micropost_id]).exists?
  end
end
