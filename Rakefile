namespace :db do
  task :environment do
    require 'active_record'
    require 'logger'
    ActiveRecord::Base.establish_connection :host => 'localhost' ,:adapter => 'postgresql', :database =>  'hcards'
  end

  desc "Migrate the database"
  task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
end

namespace :utils do
  desc "Start AR console"
  task(:console) do
    require_relative 'models/init'
    require 'irb'
    puts "Loading HappieCards ActiveRecord Console.."

    #irb looks at the first arg. clear this because it's our rake task name
    ARGV.clear
    IRB.start
  end
end

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end
