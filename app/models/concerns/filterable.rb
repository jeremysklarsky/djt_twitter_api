module Filterable

  module ClassMethods
    def by_time_period(date1, date2)
      self.joins(:tweets).where("tweets.tweeted_at BETWEEN \'" + date1.strftime("%F") + "\' AND \'" + date2.strftime("%F") + "\'")
    end

  end

  module InstanceMethods
    def by_year(year)
      self.tweets.select {|tweet| tweet.tweeted_at.year == year}
    end    

    def by_time_period(date1, date2)
      self.tweets.where(:tweeted_at => date1..date2)
    end
  end
end
