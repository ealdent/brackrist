class UserSessionsController < ApplicationController
  skip_before_filter :authenticate!

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = 'Successfully logged in.'
      redirect_to pilots_url
    else
      flash[:error] = "Spai!  #{@user_session.errors.full_messages.join(', ').downcase.capitalize}"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = 'Successfully logged out.'
    redirect_to pilots_url
  end
end
