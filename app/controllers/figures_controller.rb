class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index' 
  end

	get '/figures/new' do 
		
	    erb :'figures/new'  
  	end

  	get '/figures/:id' do
    
    
    	@figure = Figure.find_by_id(params[:id])

	    erb :'figures/show'
  	end

  	 post '/figures' do 
		
  	 	@figure = Figure.create(params[:figure])
  	 	@figure.titles << Title.find_or_create_by(:name => params["title"]["name"])
  	 	@figure.landmarks <<  Landmark.find_or_create_by(:name => params["landmark"]["name"])
  	 	@figure.save
  	 	
  	 	redirect to("/figures/#{@figure.id}")

	  end

	  get '/figures/:id/edit' do  #load edit form
    
     	@figure = Figure.find_by_id(params[:id])

     	@landmarks = []
     	@figure.landmark_ids.each do |l|
     		@landmarks << Landmark.find_by_id(l)
     	end 	

      	erb :'figures/edit'
  	 end	

  	 patch '/figures/:id' do
    
   		binding.pry
   		@figure =  Figure.find_by_id(params[:id])
    	@figure.update(params[:figure])
    	@figure.landmarks <<  Landmark.find_or_create_by(:name => params["landmark"]["name"])
    	@figure.titles <<  Title.find_or_create_by(:name => params["title"]["name"])
    	@figure.save
    	

     	redirect to("/figures/#{@figure.id}")
  	end




end


