#use Pony to send email http://adam.heroku.com/past/2008/11/2/pony_the_express_way_to_send_email_from_ruby/
#start on coffeescrpt BB stuf and CSS to finish it out

require 'sinatra'
require 'sinatra/assetpack'
require 'koala'

#we use sprockets to serve our assets
class HappyCards < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :port, 9494
  set :run, true

  enable :sessions

  include Koala

  # register your app at facebook to get those infos
  # for localhost:9393. not a big security deal
  APP_ID = 400961483294720 # your app id
  APP_CODE = '7c03edeb909b49e4b756bf3413ef4665' # your app code
  SITE_URL = 'http://localhost:9393' # your app site url

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
