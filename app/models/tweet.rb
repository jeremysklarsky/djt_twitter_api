class Tweet < ApplicationRecord
  belongs_to :source

  has_many :tweet_mentions
  has_many :mentions, :through => :tweet_mentions

  has_many :tweet_hashtags
  has_many :hashtags, :through => :tweet_hashtags

  has_many :tweet_words
  has_many :words, :through => :tweet_words

  ## class method scopes
  #  Resources
  scope :by_resource,   -> (resource, text) { joins(resource.to_sym).where(resource + '.text LIKE ?', text) }
  scope :by_hashtag,    -> (hashtag)        { by_resource('hashtags', hashtag) }
  scope :by_word,       -> (word)           { by_resource('words', word) }
  scope :by_mention,    -> (mention)        { by_resource('mentions', mention) }
  scope :by_phrase,     -> (phrase)         { where("text like ?", "%" + phrase + "%") }
  scope :by_text,       -> (text)           { 
    terms = text.split(',')
    search_string = [(['text LIKE ?'] * terms.length).join(' AND ')] + terms.map {|name| "%#{name}%" }
    where(search_string)
  }

  #  Time Ranges
  scope :by_time_period,    -> (date1, date2)   { where(tweeted_at: date1..date2) }
  scope :by_year,           -> (year)           { where( ENV['cast'] + "(strftime('%Y', tweeted_at) as int) = ?", year) }
  scope :by_time_of_day,    -> (start, finish)  {
    where( ENV['cast'] + "(strftime('%H', tweeted_at) as int) >= ? AND " + ENV['cast'] + "(strftime('%H', tweeted_at) as int) < ?", start, finish)
  }
  scope :before,            -> (date)           { where("tweeted_at < ?", date) }
  scope :after,             -> (date)           { where("tweeted_at > ?", date) }
  scope :on,                -> (date)           { by_time_period(date, date + 1) }

  ## Instance Methods
  def year
    self.tweeted_at.year
  end

  def details
    # Fetches individual tweet details from Twitter API.
    TWITTER.status(self.id_str).to_h
  end

  def hour
    self.tweeted_at.hour
  end
end
