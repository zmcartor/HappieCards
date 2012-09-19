require 'active_record'
require 'excon'
require 'fog'
require 'paperclip'

#require up all the models, do this better.
require_relative 'user'
require_relative 'background'
require_relative 'card'
require_relative 'category'
require_relative 'callback'

#setup our ActiveRecord params and connection
    ActiveRecord::Base.establish_connection(
      :host => 'localhost' ,
      :adapter => 'postgresql',
      :database =>  'hcards'
    )
