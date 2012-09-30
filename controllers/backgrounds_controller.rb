class HappyCards < Sinatra::Base

  post '/backgrounds/upload' , :auth =>true do
    background = Background.new(:category_id =>params[:category_id],
                                :pic =>File.new(params[:background_file][:tempfile])
                               )
    puts "Not saved :(" unless background.save
  end

  get '/backgrounds/upload' , :auth =>true do
     @categories = Category.find(:all)
    erb :backgrounds_upload
  end

  #tuned to Backbone REST style

  get '/backgrounds/category/:cate', :auth => true do
    #grab all the backgrounds with that category
    Background.find(:all ,:conditions=>{:category_id => params[:cate]}).to_json(:methods=>:public_url)
  end

  put '/backgrounds/:id', :auth=>true do
    #update the model with :id
    puts params
  end

  post 'backgrounds/:id', :auth=> true do
    #create a new resource
    puts params
  end

end
