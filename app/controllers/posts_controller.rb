class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Kaminari.paginate_array(Post.all).page(params[:page]).per(12)
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.image.attach(params[:post][:image])
    if @post.save
      flash[:notice] = "新規投稿に成功しました。"
      redirect_to posts_path
    else
      render new_post_path
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿の編集に成功しました。"
      redirect_to post_path
    else
      render edit_post_path
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "投稿の削除に成功しました。"
      redirect_to posts_path
    else
      render post_path
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
