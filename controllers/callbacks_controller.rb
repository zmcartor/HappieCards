class HappyCards < Sinatra::Base

  #tuned to Backbone REST style

  get '/callbacks', :auth => true do
    #grab all the callbacks for this user.
  end

  put '/callbacks/:id', :auth => true do
    #update the model with :id
  end

  post '/callbacks/:id', :auth => true do
    #create a new resource
  end

  delete '/callbacks/:id', :auth => true do
    #kill card
  end

end
