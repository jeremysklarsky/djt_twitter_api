module Filterable

  module ClassMethods
    def by_time_period(date1, date2)
      start = date1 > date2 ? date2 : date1
      finish = date1 > date2 ? date1 : date2

      self.joins(:tweets).where("tweets.created_at BETWEEN \'" + start.strftime("%F") + "\' AND \'" + finish.strftime("%F") + "\'")
    end    
  end

  module InstanceMethods
    def by_year(year)
      self.tweets.select {|tweet| tweet.created_at.year == year}
    end    

    def by_time_period(date1, date2)
      start = date1 > date2 ? date2 : date1
      finish = date1 > date2 ? date1 : date2    
      self.tweets.where(:created_at => start..finish)
    end    
  end
end
