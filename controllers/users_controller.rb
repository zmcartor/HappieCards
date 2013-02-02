class HappyCards < Sinatra::Base

  get '/users/history', :auth => true do
    'user history'
  end

end
