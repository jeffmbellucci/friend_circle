module SessionsHelper
  def login(user)
    session_token = user.reset_session!
    cookies.permanent[:session_token] = session_token
    current_user = user
  end

  def logout
    current_user.reset_session!
    cookies.delete(:session_token)
    current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_session_token(cookies[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def current_user?(user)
    current_user == user
  end


end
