class TrustsController < ApplicationController
  def create
    @trust = Trust.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    trust = Trust.find_by(user_id: current_user.id, post_id: params[:post_id])
    trust.destroy
  end
end
