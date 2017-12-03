module TweetsHelper

   WORDS_ALLOWED = %w(coke coca-cola diet-cola)

	def filter_messages(tweets_array)
		tweets_array.select {|t| WORDS_ALLOWED.any? {|w|t.message.include?(w)}}
	end
end
