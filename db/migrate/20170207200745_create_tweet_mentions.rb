class CreateTweetMentions < ActiveRecord::Migration[5.0]
  def change
    create_table :tweet_mentions do |t|

      t.timestamps
      t.integer :mention_id
      t.integer :tweet_id
    end
  end
end
