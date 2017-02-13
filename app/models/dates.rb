class Dates

  def self.campaign_start
    "June 16, 2015".to_datetime
  end

  def self.election_day
    "November 8, 2016".to_datetime
  end

  def self.inauguration_day
    "January 20, 2017".to_datetime
  end

  def self.clean(date)
    if (2009..2017).to_a.map(&:to_s).include? date
      ("1/1/" + date).to_datetime 
    elsif date == 'campaign_start' || date == 'election_day' || date == 'inauguration_day'
      self.send(date)
    else
      date.to_datetime
    end
  end

  def self.split_dates(dates)
    dates.split(",").collect{|date| self.clean(date)}
  end

end