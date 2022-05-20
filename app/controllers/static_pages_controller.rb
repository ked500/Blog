class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page]
  def landing_page
    @micropost = current_user.microposts.build if user_signed_in?
  end

  def dashboard
  end
end
