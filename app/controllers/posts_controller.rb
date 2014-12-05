class PostsController < ApplicationController
  expose(:posts)
  expose(:post, attributes: :post_params)
  expose(:show_post) { PostPresenter.new(post, current_user) }
  load_and_authorize_resource only: %i(create update)

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
    params
      .require(:post)
      .permit(:title, :text)
      .merge(user_id: current_user.try(:id))
  end
end
