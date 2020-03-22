class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def new
    @post = Post.new
  end

  def create
    # binding.pry
    Post.create(post_params)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Tweet.find(params[:id])
    post.update(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:content, :news_url, tag_ids: []).merge(user_id: current_user.id)
  end
end
