require 'rails_helper'

feature 'User posts list' do
  let(:registered_user1) { create(:user, :confirmed) }
  let(:registered_user2) { create(:user, :confirmed) }

  let(:login_page) { Devise::Sessions::New.new }

  let(:my_post_page) { UserPosts::Index.new }

  let!(:my_posts) { create_list(:post, 2, user: registered_user1) }
  let!(:another_posts) { create_list(:post, 5, user: registered_user2) }

  before do
    login_page.load
    login_page.sign_in(registered_user1.email, '123456')
  end

  scenario 'user can see list of self post' do
    my_post_page.load

    expect(my_post_page.top_bar).to have_posts_link
    expect(my_post_page.top_bar).to have_user_posts_link

    expect(my_post_page).to have_posts(count: 2)
    expect(my_post_page.posts.first).to have_post_title
    expect(my_post_page.posts.first).to have_author
    expect(my_post_page.posts.first).to have_created_at
  end
end
