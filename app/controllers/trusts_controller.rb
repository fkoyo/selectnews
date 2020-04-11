class TrustsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # post.rbにtrustedメソッドを定義
    @post.trusted(current_user)
  end

  def destroy
    @post = Trust.find(params[:id]).post
    # post.rbにuntrustedメソッドを定義
    @post.untrusted(current_user)
  end
end
