class LikesController < ApplicationController
  
  def index
    @likes = Like.where(post_id: params[:post_id]).pluck(:user_id)
    @likes_users = User.find(@likes)
  end
  
  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    @like.save
    redirect_to post_path(params[:post_id]) 
  end
  
  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    redirect_to post_path(params[:post_id]) 
  end
end
