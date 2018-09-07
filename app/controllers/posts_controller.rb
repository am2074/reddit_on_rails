class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index 
  	@posts = Post.all
  end 

  def show
  end 

  def new
  	@post = Post.new
  end 
  
  #need to fix redirect to root and show message saying post has been created
  def create 
  	@post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end 
  
  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_back fallback_location: root_path
  end
  
 private

 def post_params
	params.require(:post).permit(:title,:body)
 end

 def find_post
  @post = Post.find(params[:id])
 end 
end

