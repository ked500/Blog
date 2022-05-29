class MicropostsController < ApplicationController
  before_action :correct_user, only: [:destroy, :edit]
  before_action :set_micropost, only: [:edit, :update]
  invisible_captcha only: [:create, :update]

  def edit
  end

  def update
    if @micropost.update(micropost_params)
      redirect_to root_url, notice: "Post was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      flash[:alert] = @micropost.errors.full_messages.join(", ")
      @feed_items = []
      redirect_to root_url
    end

  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

  def set_micropost
    @micropost = Micropost.find(params[:id])
  end
end
