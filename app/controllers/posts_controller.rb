class PostsController < ApplicationController
  load_and_authorize_resource
  before_action(:set_comments, only: :show)

  respond_to :html

  def index
    respond_with @post
  end

  def show
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

  def set_comments
    @comments = @post.comments.includes(:user)
    @comment =  @comments.build
  end

  def post_params
    params
      .require(:post)
      .permit(:title, :text)
  end
end
