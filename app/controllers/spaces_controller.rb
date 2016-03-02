class SpacesController < ApplicationController

	before_filter :authenticate_user!, except: [:index, :show]

  def index

  end

  
  def new

    if params[:address] == ""
      flash[:notice] = "Please the address of the parking space, including city and state"

    elsif params[:address] != nil

      @address = params[:address]
      @coordinates = Geocoder.coordinates(@address)
      
      @lat = @coordinates[0]
      @long = @coordinates[1]
      spots = {"lat" => @lat.to_f, "long" => @long.to_f}

      current_user.role = "owner"
      current_user.save

      @hash = Gmaps4rails.build_markers(spots) do |spot, marker|
          marker.lat @lat.to_f
          marker.lng @long.to_f

      end    
    	
    end
    
  end

  def edit
  end

  def show
    @spaces = Space.all



    if params[:address] != nil && params[:address] != ""
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
      flash[:notice] = "Please enter the address you would like to find spaces near"
      
    end



  end


  def confirm
    @space = Space.new

    if current_user.role = "owner"
      @space.user_id = current_user.id
    else
      @space.renter_id = current_user.id
    end
    
    @space.address = params[:address]
    @space.open = true
    @space.save
  end
end
