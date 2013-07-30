#!/usr/bin/env ruby
require 'httparty'

class HipsterJesus
  include HTTParty
  format :json
end

class RamblingHipster
  def self.speak
    response = HipsterJesus.get('http://hipsterjesus.com/api/?paras=20&type=hipster-centric')

    words = response['text'].split(' ').collect {|x| x.gsub(/<.*?>/,"").gsub(/\W/, "")}
    sentence = words.sample(5).join(' ')
    final = words.keep_if { |w| w == w.downcase and w.end_with? "s" }.sample

    potlucks = ["Thundercats","squid","whatever","tattooed","letterpress","skateboard","Williamsburg","Portland","freegan","lo-fi","Brooklyn","hoodie","leggings","mustache","food truck","raw denim","jean shorts","tofu","trust fund","beard","wolf moon","DIY","fixie","farm-to-table","seitan","put a bird on it","VHS","mixtape","photo booth","artisan","scenester"]


    if (rand(8) == 4)
      status = "Wanna have a #{potlucks.sample} potluck?" 
    else
      status = "You probably haven't heard of #{sentence} #{final}."
    end
    return status
  end
end
