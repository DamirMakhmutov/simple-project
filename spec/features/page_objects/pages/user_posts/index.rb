module UserPosts
  class Index < SitePrism::Page
    set_url '/user_posts'

    section :top_bar, TopBar, '.top-bar'
    section :action_buttons, ActionSection, '.top-actions'
    sections :posts, PostSection, '.post-list li'
  end
end
