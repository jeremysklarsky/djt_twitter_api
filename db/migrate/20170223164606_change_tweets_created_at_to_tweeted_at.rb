class ChangeTweetsCreatedAtToTweetedAt < ActiveRecord::Migration[5.0]
  def change
    rename_column :tweets, :created_at, :tweeted_at
  end
end
