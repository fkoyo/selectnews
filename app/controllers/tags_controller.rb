class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    Tag.create(tag_params)
    redirect_to posts_path
  end

  private
  def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
