class Api::ShootersController < ApplicationController
  
  respond_to :xml, :json, :html
  skip_before_filter :verify_authenticity_token
  
  layout false
  
  def update
    @shooter = Shooter.find_by_shortcode_url(params[:id])
    if @shooter.add_payload(params[:payload])
      render :inline => "OK, payload added\n"
    else
      render :inline => "Sorry, payload rejected\n"
    end
  end
  
  def shoot
    @shooter = Shooter.find_by_shortcode_url(params[:id])
    @shooter.shoot!
    render :inline => "BANG! Payload killed\n"
  end
  
end
