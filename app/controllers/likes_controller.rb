class LikesController < ApplicationController
  # def new
  #   @like = Like.new
  # end

  def create
    binding.pry
    like = current_user.likes.build(post_id: params[:post_id], like_id: params[:like_id])
    # redirect_to root_path
  end

  # def create
  #   Like.create(like_params)
  #   redirect_to posts_path
  # end

  # private
  # def like_params
  #   params.require(:like).permit(:like_name)
  # end
end
