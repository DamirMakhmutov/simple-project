class PostShowSection < SitePrism::Section
  element :post_title, '.post-title'
  element :author, '.author'
  element :created_at, 'span'
  element :post_text, '.post-body'
end
