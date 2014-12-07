class CommentsController < ApplicationController
  load_and_authorize_resource :post
  load_and_authorize_resource :comment, through: :post

  respond_to :html

  def create
    @comment.save
    respond_with @post
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:text, :post_id)
  end
end
