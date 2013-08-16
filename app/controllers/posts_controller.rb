class PostsController < ApplicationController

  def new
    @post = Post.new
    @circles = current_user.circles
    render :new
  end

  def create
    params[:post][:owner_id] = current_user.id
    @post = Post.new(params[:post])
    if @post.save
      redirect_to current_user
    else
      debugger
      @circles = current_user.circles
      render :new
    end
  end


end
