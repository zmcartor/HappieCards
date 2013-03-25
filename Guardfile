guard 'coffeescript', :input => 'public/javascript' do
  watch(%r{^public/javascript/(.+\.coffee)$})
end

guard 'coffeescript', :input => 'spec/coffeescripts' , :output => 'spec/javascripts' do
  watch(%r{^spec/coffeescripts/(.+\.coffee)$})
end

guard 'jasmine', :jasmine_url => 'http://localhost:8888/', :phantomjs_bin => '/Users/zm/.phantomjs/1.6.0/darwin/bin/phantomjs', :specdoc=> :always, :console => :always   do
  watch(%r{spec/javascripts/(.+\.js)$})
end
