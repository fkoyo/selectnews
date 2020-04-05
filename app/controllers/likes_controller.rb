class LikesController < ApplicationController
  # def new
  #   @like = Like.new
  # end

  def create
    like = Like.create(like_params)
    binding.pry
    redirect_to posts_path
  end

  private
  def like_params
    params.permit(like_id: params[:like_id], post_id: params[:post_id], user_id: current_user.id)
    # .merge(user_id: current_user.id)
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
