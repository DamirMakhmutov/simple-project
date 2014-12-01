class PostsController < ApplicationController
  expose(:posts)
  expose(:post, attributes: :post_params)

  respond_to :html

  def index
  end

  def show
  end

  def create
    post.save

    respond_with post
  end

  def update
    post.save

    respond_with post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
