require 'rails_helper'

feature 'User posts show' do
  let(:login_page) { Devise::Sessions::New.new }

  let(:registered_user) { create(:user, :confirmed) }
  let(:my_page) { UserPosts::Show.new }

  let!(:post) { create(:post, user: registered_user) }

  before do
    login_page.load
    login_page.sign_in(registered_user.email, '123456')
  end

  scenario 'view the user post page' do
    my_page.load(post_id: post.id)

    expect(my_page.top_bar).to have_posts_link
    expect(my_page.top_bar).to have_user_posts_link

    expect(my_page.action_buttons).to have_create_post_button
    expect(my_page.action_buttons).to have_edit_post_button

    expect(my_page).to have_post
    expect(my_page.post).to have_post_title
    expect(my_page.post).to have_author
    expect(my_page.post).to have_created_at
  end
end
