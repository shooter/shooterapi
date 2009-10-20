ActionController::Routing::Routes.draw do |map|
  map.root :controller => "home", :action => "show"
  
  map.resource 'home', :controller => "home"
  
  # Registration & Sign in routes
  map.login '/login', :controller => :user_sessions, :action => :new
  map.logout '/logout', :controller => :user_sessions, :action => :destroy
  map.resources :users, :only => [:new, :create]
  map.resource  :user_session
  
  # My routes
  map.namespace 'my' do |my|
    
    my.root :controller => 'dashboard', :action => 'show'
    my.resource :dashboard, :controller => "dashboard"
    
    my.resources :shooters, :member => {:shoot => :delete} do |shooter|
      shooter.resources :mufflers
      shooter.resources :webhooks
    end
  end
  
  # API routes
  map.namespace :api do |api|
    api.resources :shooters, :member => {:shoot => :delete}
  end
end
