class LandmarksController < ApplicationController

	get '/landmarks' do
    
    	@landmarks = Landmark.all

    	erb :'/landmarks/index' 
  	end

	get '/landmarks/new' do 		
	    erb :'landmarks/new'  
  	end

  	get '/landmarks/:id' do

  		binding.pry

    	@landmark = Landmark.find_by_id(params[:id])

	    erb :'landmarks/show'
  	end

  	post '/landmarks' do 

		
  	 	@landmark = Landmark.create(params[:landmark])
  	 	
  	 	@landmark.save
  	 	
  	 	redirect to("/landmarks/#{@landmark.id}")

	 end

	 get '/landmarks/:id/edit' do  #load edit form
    
     	@landmark = Landmark.find_by_id(params[:id])

      	erb :'landmarks/edit'
  	 end	

  	  patch '/landmarks/:id' do
    
   		
   		@landmark =  Landmark.find_by_id(params[:id])
    	@landmark.update(params[:landmark])
    	#@figure.landmarks <<  Landmark.find_or_create_by(:name => params["landmark"]["name"])
    	#@figure.titles <<  Title.find_or_create_by(:name => params["title"]["name"])
    	@landmark.save
    	

     	redirect to("/landmarks/#{@landmark.id}")
  	end

end
