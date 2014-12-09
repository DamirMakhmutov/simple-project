class PostSection < SitePrism::Section
  element :post_title, '.post-title a'
  element :author, '.author'
  element :created_at, '.post-date'
end
