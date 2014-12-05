require 'rails_helper'

describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:post) }

  it { is_expected.to validate_presence_of :text }
end
