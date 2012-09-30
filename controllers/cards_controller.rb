class HappyCards < Sinatra::Base

  get '/cards/home', :auth=>true do
    #TODO show category listing
    #output result of session[happie_steps] to maintain state
    #throughout the steps
    erb :cards_home
  end

  #tuned to Backbone REST style

  get '/cards', :auth => true do
    #grab all the cards with that category
  end

  put '/cards/:id', :auth=> true do
    #update the model with :id
  end

  post '/cards/:background_id', :auth=> true do
    #create a new resource with this background_id
  end

  delete '/cards/:id' , :auth=> true do

    #kill card

  end

end
