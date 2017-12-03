class TweetsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  include TweetsHelper

  def index
  	# IMPLEMENTATION # 1:
  	# ================================================================
  	# This implementation uses ActiveRecord to query all the records
  	# then it takes the elements that containg the {WORDS_ALLOWED} 
  	# in their messages.
  	# this implementation has bad performance in the long run
  	# as we are requesting all Tweets from the database then only taking the ones we need
  	# 
  	# this implementation uses a filter_messages helper method under the
  	# TweetsHelper module to help us in the filtering of messages.
  	#
  	# ACTIVE RECORD SQL STATEMENT USED IN THIS SOLUCION IS EQUIVALENT TO:
  	# SELECT * FROM tweets ORDER BY sentiment DESC;
	#
  	# Note: Please note that `filter_messages` will need to be updated to `t.message`
  	# ===============================================================
  	# @tweets = filter_messages(Tweet.all.order(sentiment: :desc))



  	# IMPLEMENTATION # 2:
  	# ========================================================================
  	# This second implementation has a better performance 
  	# in the long run as we are only querying the rows that contain
  	# the {WORDS_ALLOWED} in there messages  and we don't have to do extra work
  	# after having the information needed, we are just relying all the heavy 
  	# lifting on pure SQL
  	#
  	# ACTIVE RECORD SQL STATEMENT USED IN THIS SOLUCION IS EQUIVALENT TO:
  	# SELECT * FROM tweets WHERE message ilike any (array['%coke%', '%coca-cola%', '%diet-cola%'])ORDER BY sentiment DESC;
  	# ========================================================================
  	@tweets = Tweet.where("message ILIKE ANY ( array[?] )", WORDS_ALLOWED.map {|brand| "%#{brand}%" }).order(sentiment: :desc)
  end

  def create
    # Storing only tweets that contain the {WORDS_ALLOWED} in TweetsHelper
  	# filter_messages(DevTestApiApp.new.tweets).each do |t|
  	# 	Tweet.find_or_create_by(user_id: t["id"], user_handle: t["user_handle"], message: t["message"], 
  	# 		sentiment: t["sentiment"], followers: t["followers"], created_at: t["created_at"], updated_at: t["updated_at"])
  	# end


     # Storing all tweets regardless if their messages contain the {WORDS_ALLOWED} in TweetsHelper
    DevTestApiApp.new.tweets.each do |t|
      Tweet.find_or_create_by(user_id: t["id"], user_handle: t["user_handle"], message: t["message"], sentiment: t["sentiment"], followers: t["followers"], created_at: t["created_at"], updated_at: t["updated_at"])
    end
  	redirect_to root_path
  end
end
