class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.password_hash == params[:session][:password]
      flash[:message] = "Welcome back!"
      login(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
