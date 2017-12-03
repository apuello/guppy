class TweetsController < ApplicationController
  include TweetsHelper
  
  def index
  	@tweets = filter_messages(Tweet.all.order(sentiment: :desc))
  end
end
