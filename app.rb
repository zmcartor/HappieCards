require 'bundler'
Bundler.require :default

#we use sprockets to serve our assets
class HappyCards < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :port, 9494
  set :run, true

  enable :sessions

  include Koala

  configFB = YAML.load_file('config/access.yml')['Facebook']

  APP_ID = configFB['app_id']
  APP_CODE = configFB['app_code']
  SITE_URL = configFB['site_url']

  #used to parse the FB cookie set via JS SDK
  def verify_user()
    unless session[:happie_user]
      @oauth = Facebook::OAuth.new(APP_ID, APP_CODE, SITE_URL)
      infos = @oauth.get_user_info_from_cookies(request.cookies)
      return false if not infos
      session[:happie_user] = User.new.sign_in infos
      puts "creating a new session!"
      true
    end
  end

  #setup our route condition to require a happie session
  set(:auth) do |x|
    condition do
      unless session[:happie_user]
        redirect("/" , 303) if not verify_user
      end
    end
  end

  get '/' do
    erb :homepage
  end

  #after requests are done, close those connections foo!
  after{ ActiveRecord::Base.clear_active_connections! }

end

#require at the end after base class is defined
require_relative 'models/init'
require_relative 'controllers/init'
