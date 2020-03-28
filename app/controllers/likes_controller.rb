class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    Like.create(like_params)
    redirect_to posts_path
  end

  private
  def like_params
    params.require(:like).permit(:like_name)
  end
end
