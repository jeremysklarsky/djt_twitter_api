# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

years = (2009..2017).to_a
tweets = [];
baseURI = "http://www.trumptwitterarchive.com/data/realdonaldtrump/"

years.each do |year|

  uri = URI.parse(baseURI + year.to_s + ".json")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)

  response = http.request(request)

  if response.code == "200"
    result = JSON.parse(response.body)
    tweets.concat(result)
    
  else
    puts "ERROR!!!"
  end
end

tweets.sort_by {|k,v| k[ "created_at"].to_datetime.strftime}.each do |tweet|
  source = Source.find_or_create_by(:name => tweet["source"])
  tweet["source"] = source
  tweet = Tweet.new(
    {:text => tweet["text"],
    :created_at => tweet["created_at"],
    :is_retweet => tweet["is_retweet"],
    :id_str => tweet["id_str"]}
  )

  tweet.source = source
  tweet.save

end