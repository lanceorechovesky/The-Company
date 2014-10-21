class TagsController < ApplicationController

  def index
    @tag = Tag.all
  end

  def show
    @post = Post.find params[:post_id]
    @tag = Tag.find params[:id]
  end

end
