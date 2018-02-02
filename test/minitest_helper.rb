ENV['REDIS_URL'] = 'redis://localhost:6379/2'

require 'bundler/setup'

require 'simplecov'
SimpleCov.start do
  add_filter %r{^/test/}
end

require 'minitest/autorun'
require 'minitest/around/spec'
require 'minitest/power_assert'
require 'database_cleaner'
require 'study20180216'

DatabaseCleaner.strategy = :truncation

module MiniTest
  class Spec
    before :each do
      DatabaseCleaner.start
    end

    after :each do
      DatabaseCleaner.clean
    end
  end
end
