class My::MufflersController < InheritedResources::Base
  before_filter :require_user
  belongs_to :shooter
  
  def create
    create!{ [:my, @muffler.shooter] }
  end
  
  def destroy
    destroy!{ [:my, @muffler.shooter] }
  end
  
protected
  def begin_of_association_chain
    current_user
  end
end