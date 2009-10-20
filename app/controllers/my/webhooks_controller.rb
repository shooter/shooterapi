class My::WebhooksController < InheritedResources::Base
  before_filter :require_user
  belongs_to :shooter

  def create
    create!{ [:my, @webhook.shooter] }
  end

  def destroy
    destroy!{ [:my, @webhook.shooter] }
  end

protected
  def begin_of_association_chain
    current_user
  end
end
