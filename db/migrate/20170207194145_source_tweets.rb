class SourceTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :source_tweets, :id => false do |t|
      t.integer :tweet_id
      t.integer :client_id
    end

  end
end
