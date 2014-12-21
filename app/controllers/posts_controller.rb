class PostsController < ApplicationController
  expose(:posts) { |d| d.includes(:user) }
  expose(:post)
  expose(:comments, ancestor: :post) { |d| d.includes(:user) }
  expose(:comment) { comments.build }

  def index
    self.posts = PostPresenter.wrap(posts)
  end

  def show
    self.post = PostPresenter.new(post)
  end
end
