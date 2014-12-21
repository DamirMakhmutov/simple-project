class CommentsController < ApplicationController
  before_action :authenticate_user!

  expose(:post) { |d| PostPresenter.new(d) }
  expose(:comments, ancestor: :post) { |d| d.includes(:user) }
  expose(:comment, attributes: :comment_params)

  def create
    if comment.save
      redirect_to post.object, notice: 'comment was created.'
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:text, :post_id)
      .merge(user: current_user)
  end
end
