class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|

      t.timestamps
      t.string      :text
      t.datetime    :created_at
      t.boolean     :is_retweet
      t.string      :id_str
    end
  end
end