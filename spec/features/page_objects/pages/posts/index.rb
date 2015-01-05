module Posts
  class Index < SitePrism::Page
    set_url '/'

    section :top_bar, TopBar, '.top-bar'
    sections :posts, PostSection, '.post-list li'
  end
end
