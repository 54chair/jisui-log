class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "コメントに成功しました。"
      redirect_to post_path
    else
      flash[:alert] = "コメントの削除に失敗しました。"
      redirect_to post_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "コメントの削除に成功しました。"
      redirect_to post_path
    else
      flash[:alert] = "コメントの削除に失敗しました。"
      redirect_to post_path
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
  
end
