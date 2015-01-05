module UserPosts
  class Show < SitePrism::Page
    set_url '/user_posts{/post_id}'

    section :top_bar, TopBar, '.top-bar'
    section :action_buttons, ActionSection, '.top-actions'
    section :post, PostShowSection, '.post'
  end
end
