require 'rails_helper'

describe Comment do
  subject(:comment) { create :comment }

  it { should belong_to(:user) }
  it { should belong_to(:post) }

  it { is_expected.to validate_presence_of :text }

  it { should ensure_length_of(:text).is_at_least(2) }

  it { expect(comment.user_full_name).to eq comment.user.full_name }
end
