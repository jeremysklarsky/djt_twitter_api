class AddYearToTweetHashtags < ActiveRecord::Migration[5.0]
  def change
    add_column :tweet_hashtags, :year, :integer    
  end
end
