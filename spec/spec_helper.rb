require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
