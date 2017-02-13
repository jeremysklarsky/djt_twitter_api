namespace :mentions do
  desc "log mention"
  task log: :environment do

    Tweet.all.each do |tweet|  
      mentions = tweet.text.scan(/@([a-z0-9_]+)/i).flatten
      if mentions.size
        mentions.each do |username|
          if username != "realDonaldTrump"
            mention = mention = Mention.find_or_create_by(:user => username)
            TweetMention.create(:tweet => tweet, :mention => mention)
          end
        end
      end
    end
  end

  desc "add year"
  task years: :environment do 
    TweetMention.all.each do |tm|
      tm.year = tm.tweet.year
      tm.save
    end
  end
end
