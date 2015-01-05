require 'rails_helper'

feature 'New user post' do
  let(:user) { create :user, :confirmed }

  let(:login_page) { Devise::Sessions::New.new }
  let(:new_post_page) { UserPosts::New.new }
  let(:post_page) { UserPosts::Show.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')

    new_post_page.load
  end

  scenario 'User creates post ' do
    new_post_page.create_post('Title', 'Text')

    expect(new_post_page).to have_success_create_alert
    expect(post_page.post).to have_post_title(text: 'Title')
  end

  scenario 'User creates post with blank data' do
    new_post_page.create_post('', '')

    expect(new_post_page).to have_empty_title_error
    expect(new_post_page).to have_empty_content_error
  end
end
