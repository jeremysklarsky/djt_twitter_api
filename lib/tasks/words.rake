namespace :words do
  desc "TODO"
  task log: :environment do

    Tweet.all.each do |tweet|
      tweet.text.split.map {|word| word.gsub(/\W+/, '').downcase}.each do |word|
        word_obj = Word.find_or_create_by(:word => word)
        TweetWord.create(:tweet => tweet, :word => word_obj, :year => tweet.created_at.year)
        SourceWord.create(:source => tweet.source, :word => word_obj, :year => tweet.created_at.year)
      end
    end
  end

  desc "TODO"
  task clear: :environment do
    Word.destroy_all
    TweetWord.destroy_all
    SourceWord.destroy_all
  end
end
