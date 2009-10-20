class UsersController < ApplicationController
  before_filter :require_no_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to my_dashboard_path
    else
      render :new
    end
  end

end