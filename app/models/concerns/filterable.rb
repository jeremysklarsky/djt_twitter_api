module Filterable

  module ClassMethods
    def by_time_period(date1, date2)
      self.joins(:tweets).where("tweets.created_at BETWEEN \'" + date1.strftime("%F") + "\' AND \'" + date2.strftime("%F") + "\'")
    end

  end

  module InstanceMethods
    def by_year(year)
      self.tweets.select {|tweet| tweet.created_at.year == year}
    end    

    def by_time_period(date1, date2)
      self.tweets.where(:created_at => date1..date2)
    end
  end
end
