class PostsController < ApplicationController
  before_action(:set_posts, only: :index)
  load_and_authorize_resource

  respond_to :html

  def index
    respond_with @posts
  end

  def show
    set_comments
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

  def set_posts
    @posts = Post.includes :user
  end

  def post_params
    params
      .require(:post)
      .permit(:title, :text)
  end
end
