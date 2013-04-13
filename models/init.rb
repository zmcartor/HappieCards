Bundler.require :DB, :default

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

    # Load up Paperclip default settings if applicable
    begin
      paperclip_defaults = YAML.load_file('config/paperclip.yml')
      
      #Format this hash with :symbol indexes, fix this up somehow ... 
      formatted_hash = paperclip_defaults['defaults'].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
      formatted_hash[:fog_credentials] = formatted_hash[:fog_credentials].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      Paperclip::Attachment.default_options.merge! formatted_hash
      Paperclip::Attachment.default_options.inspect
    rescue Errno::ENOENT => e
      puts 'didnt load the paperclip file :( '
      #do nothing ...
    end
