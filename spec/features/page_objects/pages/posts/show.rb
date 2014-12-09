module Posts
  class Show < SitePrism::Page
    set_url '/posts{/post_id}'

    section :action_buttons, ActionSection, '.top-actions'
    section :post, PostShowSection, '.post'
  end
end
