require 'faraday'
require 'twitter'

require './config.rb'


conn = Faraday.new(:url => 'http://hipsterjesus.com') do |builder|
  builder.request  :url_encoded
  builder.adapter  :net_http
end


response = conn.get '/api/?paras=15&type=hipster-centric' 
sentence = response.body.split('.')[rand(100)].lstrip.gsub(/<\/?[^>]*>/, "").gsub('\n','').downcase

#pick a single word for the potluck

potlucks = ["Thundercats","squid","whatever","tattooed","letterpress","skateboard","Williamsburg","Portland","freegan","lo-fi","Brooklyn","hoodie","leggings","mustache","food truck","raw denim","jean shorts","tofu","trust fund","beard","wolf moon","DIY","fixie","farm-to-table","seitan","put a bird on it","VHS","mixtape","photo booth","artisan","scenester"]

#puts "Wanna have a #{potlucks.sample} potluck?"

if (rand(5) == 4)
  status = "Wanna have a #{potlucks.sample} potluck?" 
else
  status = "You probably haven't heard of #{sentence}."
end

puts status
#puts sentence
Twitter.update(status)
#Twitter.update("Wanna have a cosby sweater potluck?")

