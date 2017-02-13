class CreateTweetWords < ActiveRecord::Migration[5.0]
  def change
    create_table :tweet_words do |t|

      t.timestamps
      t.integer :year
      t.integer :tweet_id
      t.integer :word_id
    end
  end
end
