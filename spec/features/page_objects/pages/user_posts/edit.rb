module UserPosts
  class Edit < SitePrism::Page
    include Formulaic::Dsl

    set_url '/user_posts/{/post_id}/edit'

    element :update_post_button, 'input[value="Update Post"]'
    element :empty_title_error, '.post_title .error', text: "can't be blank"
    element :empty_content_error, '.post_text .error', text: "can't be blank"
    element :success_update_alert, '.alert-box', text: 'Post was updated'
    section :top_bar, TopBar, '.top-bar'

    def update_post(title, text)
      fill_form(
        :post,
        title: title,
        text: text
      )

      update_post_button.click
    end
  end
end
