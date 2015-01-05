module Posts
  class Show < SitePrism::Page
    set_url '/posts{/post_id}'

    section :post, PostShowSection, '.post'
  end
end
