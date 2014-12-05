class PostsController < ApplicationController
  load_and_authorize_resource

  respond_to :html

  def index
    respond_with @post
  end

  def show
    @post = PostPresenter.new(@post, current_user)
    respond_with @post
  end

  def create
    @post.save
    respond_with @post
  end

  def update
    @post.update_attributes(post_params)
    respond_with @post
  end

  private

  def post_params
    params
      .require(:post)
      .permit(:title, :text)
  end
end
