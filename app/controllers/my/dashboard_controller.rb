class My::DashboardController < ApplicationController
  before_filter :require_user
  
  def show
    redirect_to my_shooters_path
  end
end