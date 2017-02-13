class TweetWord < ApplicationRecord

  belongs_to :tweet
  belongs_to :word
  
end
