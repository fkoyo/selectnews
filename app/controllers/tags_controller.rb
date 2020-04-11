class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end
  
  def create
    Tag.create(tag_params)
    redirect_to posts_path
  end
  
  # def search
  #   @tag = Tag.find(params[:id])
  #   posts = @tag.posts
  #   searchd_posts = post.where("content LIKE(?)", "%#{params[:keyword]}%")
  #   # binding.pry
  # end

  private
  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
