class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page]

  def landing_page
    if user_signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def dashboard
  end
end
