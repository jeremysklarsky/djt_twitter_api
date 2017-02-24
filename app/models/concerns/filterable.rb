module Filterable

  module ClassMethods
    def by_time_period(date1, date2)
      self.joins(:tweets).where("tweets.tweeted_at BETWEEN \'" + date1.strftime("%F") + "\' AND \'" + date2.strftime("%F") + "\'")
    end

    def by_time_range(start,finish)
      self.joins(:tweets)
          .where(ENV['cast'] + "(strftime('%H', tweets.tweeted_at) as int) >= ? AND " +
                 ENV['cast'] + "(strftime('%H', tweets.tweeted_at) as int) < ?", start, finish)
    end
  end

  module InstanceMethods
    def by_year(year)
      self.tweets.by_year(year)
    end    

    def by_time_period(date1, date2)
      self.tweets.by_time_period(date1, date2)
    end

    def count_by_year(year)
      self.by_year.count
    end

    def count_by_time_period(date1,date2)
      self.by_time_period(date1,date2).count
    end
  end
end
