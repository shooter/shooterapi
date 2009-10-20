class My::ShootersController < ApplicationController
  
  before_filter :require_user
  
  def index
    @shooters = current_user.shooters.paginate(:page => params[:page])
  end
  

  
  def show
    @shooter = current_user.shooters.find_by_shortcode_url(params[:id])
    @muffler = @shooter.mufflers.new
    @webhook = @shooter.webhooks.new
  end
  
  def shoot
    @shooter = current_user.shooters.find_by_shortcode_url(params[:id])
    @shooter.shoot!
    redirect_to [:my, @shooter]
  end
  
  def new
    @shooter = current_user.shooters.new
  end
  
  def create
    @shooter = Shooter.new(params[:shooter])
    @shooter.user = current_user
    if @shooter.save
      redirect_to [:my, @shooter]
    else
      render :new
    end
  end
  
  def edit
    @shooter = current_user.shooters.find(params[:id])
    if @shooter.update_attributes(params[:shooter])
      redirect_to [:my, @shooter]
    else
      render :edit
    end
  end
  
  def destroy
    @shooter = current_user.shooters.find(params[:id])
    @shooter.destroy
    redirect_to my_shooters_path
  end
  
end