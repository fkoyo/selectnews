class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC")
    @tags = Tag.all
    # ピックアップ記事で一週間の信頼できるポイントが多い記事を表すためのもの
    new_date = Time.now
    from_date = (new_date - 7.day)
    @weekly_posts = Post.where(created_at: from_date..new_date).order(trusts_count: "DESC")
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def show
    @post = Post.find_by(id: params[:id])
    return redirect_to root_path if @post.blank? 
    @likes = Like.all
    @comment = Comment.new
    @comments = @post.comments.includes(:user) if @post.present?
    # binding.pry
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:content, :news_url, tag_ids: []).merge(user_id: current_user.id)
  end
end
