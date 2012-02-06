require 'faraday'
require 'twitter'

require './config.rb'


conn = Faraday.new(:url => 'http://hipsterjesus.com') do |builder|
  builder.request  :url_encoded
  builder.adapter  :net_http
end


response = conn.get '/api/?paras=15&type=hipster-centric' 
sentence = response.body.split('.')[rand(100)].lstrip.gsub(/<\/?[^>]*>/, "").gsub('\n','').gsub('{"text":"','').downcase

#trim the sentence for Lisa
short = sentence.gsub(",",'').split(' ')

match = short[2] =~ /s$/
unless match.nil?
 short[2] = short[2][0...match]
end 

sentence = "#{short[0]} #{short[1]} #{short[2]}s" 

#pick a single word for the potluck

potlucks = ["Thundercats","squid","whatever","tattooed","letterpress","skateboard","Williamsburg","Portland","freegan","lo-fi","Brooklyn","hoodie","leggings","mustache","food truck","raw denim","jean shorts","tofu","trust fund","beard","wolf moon","DIY","fixie","farm-to-table","seitan","put a bird on it","VHS","mixtape","photo booth","artisan","scenester"]

#puts "Wanna have a #{potlucks.sample} potluck?"

if (rand(5) == 4)
  status = "Wanna have a #{potlucks.sample} potluck?" 
else
  status = "You probably haven't heard of #{sentence}."
end
#puts potlucks.sample
puts status
#Twitter.update("You probably haven't heard of gluten-free mcsweeney's organics.")
#Twitter.update(status)
#Twitter.update("Wanna have a cosby sweater potluck?")

