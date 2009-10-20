module AuthlogicHelper
  def logged_in?
    current_user
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def access_denied
    store_location
    redirect_to login_path
    return false
  end
  
  def require_admin_user
    return access_denied unless current_user and current_user.admin?
  end

  def require_user
    unless current_user
      access_denied
    end
  end

  def require_no_user
    if current_user
      store_location
      redirect_to root_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end