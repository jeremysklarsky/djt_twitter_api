class DropRetweetFromTweets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :is_retweet
  end
end
