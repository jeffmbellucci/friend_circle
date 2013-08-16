class CirclesController < ApplicationController
  def new
    @circle = Circle.new
    @users = User.all
    render :new
  end

  def create
   params[:circle][:owner_id] = current_user.id
    @circle = Circle.new(params[:circle])
    @circle.save!
    redirect_to current_user
  end

  def destroy
  end

end
