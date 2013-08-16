class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
    render :new
  end

  def create
    password = compare_password_and_confirmation(params[:user][:password],
                                              params[:user][:password_confirm])
    @user = User.new(username: params[:user][:username], password: password)
    if @user.save
      login(@user)
      flash[:message] = "User created."
      render :show
      return
    end
    render :new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
end
