require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  test "check model" do
  	tweet = Tweet.last
    assert 2, tweet.user_id
    assert "user_two", tweet.user_handle
    assert 0.9, tweet.sentiment
    assert 300, tweet.followers
  end
end
