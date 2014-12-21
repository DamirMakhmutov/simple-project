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
  end
end
