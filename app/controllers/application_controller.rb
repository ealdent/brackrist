class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :record_user_activity

  helper_method :current_user_session, :current_user

  private

  def authenticate!
    redirect_to new_user_session_url unless current_user
  end

  def record_user_activity
    return true unless current_user
    current_user.record_login(request)
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
end