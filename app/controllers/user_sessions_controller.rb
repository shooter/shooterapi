class UserSessionsController < ApplicationController
  skip_before_filter :require_user # Override application wide filter
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
 
  def new
    @user_session = UserSession.new
  end
 
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_back_or_default my_dashboard_url
    else
      render :new
    end
  end
 
  def destroy
    current_user_session.destroy
    redirect_back_or_default root_url
  end
end