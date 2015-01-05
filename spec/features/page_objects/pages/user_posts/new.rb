module UserPosts
  class New < SitePrism::Page
    include Formulaic::Dsl

    set_url '/user_posts/new'

    element :create_post_button, 'input[value="Create Post"]'
    element :empty_title_error, '.post_title .error', text: "can't be blank"
    element :empty_content_error, '.post_text .error', text: "can't be blank"
    element :success_create_alert, '.alert-box', text: 'Post was created'
    section :top_bar, TopBar, '.top-bar'

    def create_post(title, text)
      fill_form(
        :post,
        title: title,
        text: text
      )

      create_post_button.click
    end
  end
end
