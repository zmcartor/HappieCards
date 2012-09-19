#thin -p 9393 -R config.ru start
class HappyCards < Sinatra::Base

  #hmm. what to use this for ?

  #show profile information ?

  get '/users/history', :auth => true do
    'user history'
  end

end
