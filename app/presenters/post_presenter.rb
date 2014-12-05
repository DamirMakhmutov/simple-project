class PostPresenter
  def initialize(post, current_user)
    @post = post
    @current_user = current_user
  end

  def title
    @post.title
  end

  def text
    @post.text
  end

  def owner?
    @post.user_id == @current_user.try(:id)
  end
end
