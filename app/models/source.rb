class Source < ApplicationRecord
  has_many :tweets

  has_many :source_words
  has_many :words, :through => :source_words

  def by_time_period(date1, date2)
    start = date1 > date2 ? date2 : date1
    finish = date1 > date2 ? date1 : date2    
    self.tweets.where(:tweeted_at => start..finish)
  end

  def top_words
    
  end

end
