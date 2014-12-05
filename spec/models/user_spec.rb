require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of :full_name }
  it { should have_many(:posts) }
  it { should have_many(:comments) }
end
