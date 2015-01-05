require 'rails_helper'

feature 'Posts List' do
  let(:registered_user) { create :user, :confirmed }

  let(:home_page) { Posts::Index.new }

  let!(:posts) { create_list :post, 5, user: registered_user }

  scenario 'guest can see list of post' do
    home_page.load

    expect(home_page.top_bar).to have_posts_link
    expect(home_page.top_bar).to_not have_user_posts_link

    expect(home_page).to have_posts(count: 5)
    expect(home_page.posts.first).to have_post_title
    expect(home_page.posts.first).to have_author
    expect(home_page.posts.first).to have_created_at
  end
end
