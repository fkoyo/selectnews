class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC")
    @tags = Tag.all
    # ピックアップ記事で一週間の信頼できるポイントが多い記事を表すためのもの
    new_date = Time.now
    from_date = (new_date - 7.day)
    @weekly_posts = Post.where(created_at: from_date..new_date).order(trusts_count: "DESC")
    # 一番最新のコメントを取得する
  end

  def new
    @post = Post.new
  end

  def create
    post = post_params.to_hash
    new_post = Post.url_content(post)
    Post.create(new_post) 
    redirect_to posts_path
  end

  def show
    @post = Post.find_by(id: params[:id])
    return redirect_to root_path if @post.blank? 
    @likes = Like.all
    @comment = Comment.new
    @comments = @post.comments.includes(:user) if @post.present?
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

  def search
    @posts = Post.search(params[:keyword])
  end

  private
  def post_params
    params.require(:post).permit(:content, :news_url, tag_ids: []).merge(user_id: current_user.id)
  end
end
