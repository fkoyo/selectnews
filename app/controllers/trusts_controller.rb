class TrustsController < ApplicationController
  def create
    # binding.pry
    @trust = Trust.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to posts_path
    # @trusts = Trust.where(post_is: params[:post_id])
    # @post = Post.all
  end

  def destroy
    trust = Trust.find_by(user_id: current_user.id, post_id: params[:post_id])
    trust.destroy
    redirect_to posts_path
  end
end
