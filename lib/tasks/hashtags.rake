namespace :hashtags do
  desc "TODO"
  task log: :environment do
    Tweet.all.each do |tweet|
      tags = tweet.text.scan(/([#])([a-z\d_]+)/i).collect{|tag| tag[1]}
      if tags.size > 0
        tags.each do |tag|
          hashtag = Hashtag.find_or_create_by(:text => tag)
          TweetHashtag.create(:tweet => tweet, :hashtag => hashtag)
        end
      end
    end
  end

  desc "add year"
  task years: :environment do 
    TweetHashtag.all.each do |th|
      th.year = th.tweet.year
      th.save
    end
  end  

end
