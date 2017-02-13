namespace :twitter do
  desc "adds new tweets"
  task add: :environment do
    count = 0;
    tweets = TWITTER.user_timeline("realDonaldTrump", {count: 200, include_rts: true})
    tweets.reverse.each do |tweet|
      if !Tweet.find_by(:id_str => tweet.id.to_s)
        count += 1
        text = tweet.text
        created_at = tweet.created_at.to_datetime
        id_str = tweet.id.to_s
        source_id = Source.find_by(:name => Nokogiri::HTML(tweets.first.source).text).id
        @tweet = Tweet.create({
          :text => text,
          :created_at => created_at,
          :id_str => id_str,
          :source_id => source_id
        })

        # hashtags
        tags = @tweet.text.scan(/([#])([a-z\d_]+)/i).collect{|tag| tag[1]}
        if tags.size > 0
          tags.each do |tag|
            hashtag = Hashtag.find_or_create_by(:text => tag)
            TweetHashtag.create(:tweet => @tweet, :hashtag => hashtag)
          end
        end

        # words
        tweet.text.split.map {|word| word.gsub(/\W+/, '').downcase}.each do |word|
          word_obj = Word.find_or_create_by(:word => word)
          TweetWord.create(:tweet => @tweet, :word => word_obj, :year => @tweet.created_at.year)
          SourceWord.create(:source => @tweet.source, :word => word_obj, :year => @tweet.created_at.year)
        end

        # mentions
        mentions = tweet.text.scan(/@([a-z0-9_]+)/i).flatten
        if mentions.size
          mentions.each do |username|
            if username != "realDonaldTrump"
              mention = mention = Mention.find_or_create_by(:user => username)
              TweetMention.create(:tweet => @tweet, :mention => mention)
            end
          end
        end
      end
    end
    puts  "Added " + count.to_s + "new tweets."
  end

  desc "test"
  task test: :environment do
    Rails.logger.info("hello")
  end
end
