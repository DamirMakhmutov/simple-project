class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  has_many :posts
  has_many :comments

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end
end
