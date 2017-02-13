class Tweet < ApplicationRecord
  belongs_to :source

  has_many :tweet_mentions
  has_many :mentions, :through => :tweet_mentions

  has_many :tweet_hashtags
  has_many :hashtags, :through => :tweet_hashtags

  has_many :tweet_words
  has_many :words, :through => :tweet_words


  def self.by_year(year)
    self.select {|tweet| tweet.created_at.year == year}
  end

  def self.by_time_period(date1, date2)
    start = date1 > date2 ? date2 : date1
    finish = date1 > date2 ? date1 : date2
    self.where(created_at: start..finish)
  end

  def self.before(date)
    self.where("created_at < ?", date)
  end

  def self.after(date)
    self.where("created_at > ?", date)
  end

  def self.on(date)
    self.by_time_period(date, date + 1)
  end

  def year
    self.created_at.year
  end

  def self.by_phrase(phrase)
    self.where("text like ?", "%" + phrase + "%")
  end

  def self.by_mention(mention)
    Mention.find_by(:user=> mention).tweets
  end

  def self.by_hashtag(hashtag)
    Hashtag.find_by(:text=> hashtag).tweets
  end

  def self.by_word(word)
    Word.find_by(:word=> word).tweets
  end

end
