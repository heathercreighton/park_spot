class SpacesController < ApplicationController

	before_filter :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
   



    if params[:address] != nil
      @address = params[:address]
      @coordinates = Geocoder.coordinates(@address)
      
      @lat = @coordinates[0]
      @long = @coordinates[1]
      spots = {"lat" => @lat.to_f, "long" => @long.to_f}






      @hash = Gmaps4rails.build_markers(spots) do |spot, marker|
          marker.lat @lat.to_f
          marker.lng @long.to_f

      end    

     

    else
    	current_user.role = "owner"
    	current_user.save
    end
    
  end

  def edit
  end

  def show
    @spaces = Space.all


  end


  def confirm
    @space = Space.new
    
    @space.user_id = current_user.id
    @space.address = params[:address]
    @space.open = true
    @space.save
  end
end
