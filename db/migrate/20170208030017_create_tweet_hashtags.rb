class CreateTweetHashtags < ActiveRecord::Migration[5.0]
  def change
    create_table :tweet_hashtags do |t|

      t.timestamps
      t.integer :hashtag_id
      t.integer :tweet_id
    end
  end
end
