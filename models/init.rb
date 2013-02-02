Bundler.require :DB

#require up all the models, do this better.
require_relative 'user'
require_relative 'background'
require_relative 'card'
require_relative 'category'
require_relative 'callback'

config = YAML.load_file('config/db.yml')

#setup our ActiveRecord params and connection
    ActiveRecord::Base.establish_connection(
      :host => config['host'],
      :adapter => config['adapter'],
      :database =>  config['database']
    )

    #globally don't include the root in json
    ActiveRecord::Base.include_root_in_json = false
