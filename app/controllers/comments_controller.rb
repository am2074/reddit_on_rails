class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable

  def index
  end
  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_back fallback_location: root_path, notice: "Comment posted successfully"
    else
      redirect_back fallback_location: root_path, notice: "Something went wrong"
    end
  end

  private

  def comment_params
    params[:comment][:user_id] = current_user.id
    params.require(:comment).permit(:body, :user_id)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end
end