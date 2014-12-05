class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :text, presence: true, length: { minimum: 2 }
end
