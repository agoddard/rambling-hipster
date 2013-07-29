Gem::Specification.new do |s|
  s.name        = 'rambling_hipster'
  s.version     = '0.0.1'
  s.date        = '2013-07-29'
  s.summary     = "A rambling hipster"
  s.description = "Generates a rambling hipster sentence, short enough for a tweet"
  s.authors     = ["Anthony Goddard"]
  s.email       = 'anthony@anthonygoddard.com'
  s.files       = ["lib/rambling_hipster.rb"]
  s.homepage    = 'https://github.com/agoddard/ramblinghipster'
  s.add_dependency 'httparty'
end
