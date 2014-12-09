require 'rails_helper'

feature 'Posts List' do
  let(:registered_user) { create :user, :confirmed }
  let(:user) { create :user }

  let(:home_page) { Posts::Index.new }

  let!(:posts) { create_list :post, 5, user: registered_user }

  scenario 'guest can see list of post' do
    home_page.load

    expect(home_page).to have_posts(count: 5)
    expect(home_page.posts.first).to have_post_title
    expect(home_page.posts.first).to have_author
    expect(home_page.posts.first).to have_created_at
    expect(home_page.action_buttons).to have_no_create_post_button
  end

  context 'when user is sign in' do
    let(:login_page) { Devise::Sessions::New.new }

    before do
      login_page.load
      login_page.sign_in(user.email, '123456')
    end

    scenario 'user can see create button' do
      expect(home_page).to have_posts(count: 5)
      expect(home_page.posts.first).to have_post_title
      expect(home_page.action_buttons).to have_create_post_button
    end
  end
end
