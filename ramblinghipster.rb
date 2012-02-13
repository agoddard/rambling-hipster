require 'faraday'
require 'twitter'

require './config.rb'


conn = Faraday.new(:url => 'http://hipsterjesus.com') do |builder|
  builder.request  :url_encoded
  builder.adapter  :net_http
end


response = conn.get '/api/?paras=15&type=hipster-centric' 
# the following worst line of code ever written will grab a random word from the 15 paragraphs & remove tags & additional characters from the response (probably better done with nokogiri or something aware of the document structure)
sentence = response.body.split('.')[rand(100)].lstrip.gsub(/<\/?[^>]*>/, "").gsub('\n','').gsub('{"text":"','').downcase

#trim the sentence for Lisa
short = sentence.gsub(",",'').split(' ')

# if the last word is already pluralized, we drop the trailing s, as we (crappily) pluralize the final word later on. 
match = short[2] =~ /s$/
unless match.nil?
 short[2] = short[2][0...match]
end 

sentence = "#{short[0]} #{short[1]} #{short[2]}s" 

potlucks = ["Thundercats","squid","whatever","tattooed","letterpress","skateboard","Williamsburg","Portland","freegan","lo-fi","Brooklyn","hoodie","leggings","mustache","food truck","raw denim","jean shorts","tofu","trust fund","beard","wolf moon","DIY","fixie","farm-to-table","seitan","put a bird on it","VHS","mixtape","photo booth","artisan","scenester"]


if (rand(8) == 4)
  status = "Wanna have a #{potlucks.sample} potluck?" 
else
  status = "You probably haven't heard of #{sentence}."
end
puts status
Twitter.update(status)
