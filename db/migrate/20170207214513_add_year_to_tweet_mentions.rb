class AddYearToTweetMentions < ActiveRecord::Migration[5.0]
  def change
    add_column :tweet_mentions, :year, :integer
  end
end
