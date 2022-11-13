class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end
  
  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(@likes)
  end
end
