class UserPostsController < ApplicationController
  before_action :authenticate_user!

  expose(:posts, ancestor: :current_user)
  expose(:post, attributes: :post_params) { |d| PostPresenter.wrap(d)}
  expose(:comments, ancestor: :post) { |d| d.includes(:user) }
  expose(:comment) { comments.build }

  def index
    self.posts = PostPresenter.wrap(posts)
  end

  def show
  end

  def create
    if post.save
      redirect_to user_post_url(post.object), notice: 'Post was created'
    else
      render 'new'
    end
  end

  def update
    if post.save
      redirect_to user_post_url(post.object), notice: 'Post was updated'
    else
      render 'edit'
    end
  end

  private

  def post_params
    params
      .require(:post)
      .permit(:title, :text)
  end

end