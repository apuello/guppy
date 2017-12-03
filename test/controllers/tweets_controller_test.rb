require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "get tweets with coke, diet-cola and coca-cola" do
  	get tweets_url 
  	
	assert_select 'title', "Guppy"
	assert_select 'h1', "Welcome to Guppy:"
	assert_select "tr" do
	  assert_select "td", 4
	end
  end
end
