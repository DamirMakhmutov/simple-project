module Posts
  class Index < SitePrism::Page
    set_url '/'

    section :top_bar, TopBar, '.top-bar'
    section :action_buttons, ActionSection, '.top-actions'
    sections :posts, PostSection, '.post-list li'
  end
end
