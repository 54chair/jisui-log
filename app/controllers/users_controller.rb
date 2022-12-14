class UsersController < ApplicationController
  def index
    @users = Kaminari.paginate_array(User.all).page(params[:page]).per(6)
  end

  def show
    @user = User.find(params[:id])
    @posts = Kaminari.paginate_array(Post.where(user_id: @user.id)).page(params[:page]).per(12)
  end
  
  def following
    @user  = User.find(params[:id])
    @users = Kaminari.paginate_array(@user.following).page(params[:page]).per(6)
    render 'following'
  end

  def followers
    @user  = User.find(params[:id])
    @users = Kaminari.paginate_array(@user.followers).page(params[:page]).per(6)
    render 'followers'
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Kaminari.paginate_array(Post.find(@likes)).page(params[:page]).per(12)
  end
end
