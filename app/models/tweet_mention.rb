class TweetMention < ApplicationRecord
  belongs_to :tweet
  belongs_to :mention
end
