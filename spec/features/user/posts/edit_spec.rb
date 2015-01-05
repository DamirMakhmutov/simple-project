require 'rails_helper'

feature 'Edit user post' do
  let(:user) { create :user, :confirmed }
  let(:post) { create :post, user: user }

  let(:login_page) { Devise::Sessions::New.new }

  let(:edit_post_page) { UserPosts::Edit.new }
  let(:post_page) { UserPosts::Show.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')

    edit_post_page.load(post_id: post.id)
  end

  scenario 'User update post ' do
    edit_post_page.update_post('Updated title', 'Updated text')

    expect(edit_post_page).to have_success_update_alert
    expect(post_page.post).to have_post_title(text: 'Updated title')
    expect(post_page.post).to have_post_text(text: 'Updated text')
  end

  scenario 'User update post with blank data' do
    edit_post_page.update_post('', '')

    expect(edit_post_page).to have_empty_title_error
    expect(edit_post_page).to have_empty_content_error
  end
end
