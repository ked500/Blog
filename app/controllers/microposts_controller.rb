class MicropostsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/landing_page'
    end

  end

  def destroy

  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
