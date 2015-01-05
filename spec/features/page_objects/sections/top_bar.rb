class TopBar < SitePrism::Section
  element :sign_in_link, 'a', text: 'Sign in'
  element :sign_out_link, 'a', text: 'Sign out'
  element :posts_link, 'a', text: 'Posts'
  element :user_posts_link, 'a', text: 'My posts'
end
