require 'rails_helper'

feature 'Posts show' do
  let(:registered_user) { create :user, :confirmed }
  let(:page) { Posts::Show.new }

  let!(:post) { create :post, user: registered_user }

  scenario 'view the post page' do
    page.load(post_id: post.id)

    expect(page).to have_post
    expect(page.post).to have_post_title
    expect(page.post).to have_author
    expect(page.post).to have_created_at
    expect(page.action_buttons).to have_no_create_post_button
  end

  context 'when user is sign in' do
    let(:login_page) { Devise::Sessions::New.new }
    let(:user) { create :user }

    before do
      login_page.load
      login_page.sign_in(user.email, '123456')
    end

    scenario 'user can see create and edit buttons' do
      page.load(post_id: post.id)

      expect(page).to have_post
      expect(page.post).to have_post_title
      expect(page.action_buttons).to have_create_post_button
      expect(page.action_buttons).to have_edit_post_button
    end
  end
end
