class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.image.attach(params[:post][:image])
    if @post.save
      redirect_to "/posts/index"
    else
      render 'posts/new'
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
