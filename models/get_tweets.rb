# This class handles connecting to the Twitter API. In Rack Todo, this lived in app.rb. Here's we've abstracted it out into its own class. This class we will then initialize in app.rb.

# Our Gemfile has the twitter gem and config/environment requires it through Bundler.

class GetTweets
  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  TWITTER = Twitter::REST::Client.new do |config|
    # go to https://dev.twitter.com/apps and create your own twitter app. Then grab your keys and replace these ones - DONE
    config.consumer_key = "zstclSidoy8EFJ0lZHUx5O0QV"
    config.consumer_secret = "HMEXe1byd3et2ehm6rUbIHlE06QTJQiNkSk0JjMEBft7vcaUBh"
    config.access_token = "3233439444-32Yn9ibL1vq4mSmwK4EyUSvLEEbkfdDd9GQI7pk"
    config.access_token_secret = "LnThkJxEt1kreTJo8FpQw1yZyj1Osv9DZX3BvhtFaVe90"
  end

  def get_search_results
    twitter_search_results = []
    binding.pry
    TWITTER.search(handle).each do |tweet|
      # binding.pry
      # we're saving the tweet user's name and the tweet text in an array of arrays
      twitter_search_results << [tweet.user.name, tweet.text]
    end
    twitter_search_results
  end

end