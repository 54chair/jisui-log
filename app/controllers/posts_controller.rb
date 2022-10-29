class PostsController < ApplicationController
  def new
    @post = Post.new  
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to '/pages/show'
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content) #パラメーターのキー
  end
end
