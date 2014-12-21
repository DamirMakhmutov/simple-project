class PostPresenter < BasePresenter
  attr_reader :post
  alias_method :object, :post

  delegate :id, :title, :title, :full_name, :comments, :text, :save, to: :post
  alias_method :author, :full_name

  def initialize(post)
    @post = post
  end

  def to_partial_path
    'posts/post'
  end

  def create_time
    post.created_at.to_s(:ds_long)
  end

  def text
    sanitize_html(post.text).html_safe
  end

  private

  def sanitize_html(html)
    Sanitize.clean(html, Sanitize::Config::RELAXED)
  end
end
