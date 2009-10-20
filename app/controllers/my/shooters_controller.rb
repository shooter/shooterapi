class My::ShootersController < InheritedResources::Base
  
  before_filter :require_user
  
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
  
  def create
    @shooter = Shooter.new(params[:shooter])
    @shooter.user = current_user
    if @shooter.save
      redirect_to [:my, @shooter]
    else
      render :new
    end
  end
  
protected

  def collection
    @shooters ||= end_of_association_chain.paginate(:page => params[:page])
  end

  def begin_of_method_chain
    current_user
  end
end