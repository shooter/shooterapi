class HomeController < ApplicationController
  def show
    redirect_to my_shooters_path if logged_in? unless request.url.include?('home')
    @user_session = UserSession.new
  end
end