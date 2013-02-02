# A sample Guardfile
# More info at https://github.com/guard/guard#readme
guard 'coffeescript', :input => 'public/javascript'
guard 'coffeescript', :input => 'spec/coffeescripts' , :output => 'spec/javascripts'

guard 'jasmine', :jasmine_url => 'http://localhost:8888/', :phantomjs_bin => '/Users/zm/.phantomjs/1.6.0/darwin/bin/phantomjs', :specdoc=> :always, :console => :always   do
  watch(%r{spec/javascripts/(.+)\.coffee$})
end
