class PlacesController < ApplicationController

  def index
      @places = Place.all.page(params[:page]).per(3)
  end


  def new
    @place = Place.new # creates the FORM for place
  end

  def create
    Place.create(place_params) # sends values to the database
    redirect_to root_path # sends user to the root
  end

  private 

  def place_params
    params.require(:place).permit(:name, :description, :address) # pulls values from place FORM
  end

end
