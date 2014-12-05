require 'rails_helper'

describe Post do
  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :text }
end
