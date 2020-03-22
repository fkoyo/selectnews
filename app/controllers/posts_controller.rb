class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private
  def post_params
    params.require(:post).permit(:content, :news_url)
  end
end
