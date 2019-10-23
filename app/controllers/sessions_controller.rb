class SessionsController < ApplicationController

  def new
  end

  def create
    current_user = nil
    user = User.find_by(username: params[:session][:username].downcase)

    # if user && user.authenticate(params[:session][:password])

    if user && user.password == (params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    session.clear
    cookies.clear
    current_user = nil
    redirect_to login_path
  end
end
