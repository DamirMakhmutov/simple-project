require 'rails_helper'

describe Post do
  subject(:post) { create :post }
  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :text }

  it { should ensure_length_of(:title).is_at_least(2) }
  it { should ensure_length_of(:title).is_at_most(50) }

  it { should ensure_length_of(:text).is_at_least(2) }

  it { expect(post.full_name).to eq post.user.full_name }
end
