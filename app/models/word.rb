class Word < ApplicationRecord
  extend Statable::ClassMethods
  include Statable::InstanceMethods

  extend Filterable::ClassMethods
  include Filterable::InstanceMethods

  has_many :tweet_words
  has_many :tweets, :through => :tweet_words

  has_many :source_words
  has_many :sources, :through => :source_words

  alias_attribute :word, :text  

  # Module Method Overrides

  def self.by_time_period(date1, date2)
    # invoking super defers to Filterable class method "by_time_period", and returns all words from a given time period
    # we then filter down from the MostUsed words list
    super.where.not(word: MostUsed.words)
  end  

  def self.by_time_range(start,finish)
    # invoking super defers to Filterable class method "by_time_range", and returns all words from a given time period
    # we then filter down from the MostUsed words list    
    super.where.not(word: MostUsed.words)
  end

end
