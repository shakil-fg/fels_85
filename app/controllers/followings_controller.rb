class FollowingsController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @title = (t :following)
    @user = User.find params[:user_id]
    @users = @user.following.paginate page: params[:page]
    render 'show_follow'
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t :log_in_flash
      redirect_to login_url
    end
  end

end
