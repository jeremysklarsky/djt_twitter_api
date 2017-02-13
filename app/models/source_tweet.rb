class SourceTweet < ApplicationRecord
  belongs_to :tweet
  belongs_to :source
end
