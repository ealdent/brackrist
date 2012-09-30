class UserSessionsController < ApplicationController
  skip_before_filter :authenticate!

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      Rails.logger.debug "********** WHOOP!"
      redirect_to pilots_url
    else
      Rails.logger.debug "********** DAFUQ!"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
  end
end
