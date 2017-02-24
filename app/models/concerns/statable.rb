module Statable

  module ClassMethods
    def top(limit=10)
      scope = self.joins(:tweets)

      if self == Word
        scope = scope.where.not(word: MostUsed.words) 
      end

      scope.sort_by_count(limit)
    end

    def top_by_year(year, limit=10)
      start = "January 1, " + year.to_s
      finish = "January 1, " + (year+1).to_s
      self.top_by_time_period(start.to_datetime, finish.to_datetime)
    end

    def top_by_time_period(date1, date2, limit=10)
      self.by_time_period(date1, date2).sort_by_count(limit)
    end

    def top_by_time_of_day_range(start, finish, limit=10)
      self.by_time_range(start, finish).sort_by_count(limit)
    end

    def sort_by_count(limit)
      self.group(:text).count.sort_by {|k,v| v}.reverse.first(limit).to_h
    end
  end

  module InstanceMethods
    def count
      self.tweets.size
    end

    def count_by_year(year)
      self.by_year(year).size
    end
    
    def count_by_time_period(date1,date2)
      self.by_time_period(date1,date2).size
    end

  end
end
