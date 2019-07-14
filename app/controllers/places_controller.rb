class PlacesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] # before filter, allow editing to logged in users
  # these actions in controller are available to user if logged in only
  def index
      @places = Place.all.page(params[:page]).per(3)
  end


  def new
    @place = Place.new # creates the FORM for place
  end

  def create
    # Place.create(place_params) # sends values to the database
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path # sends user to the root
    else
      render :new, status: :unprocessable_entity
    end 

  end


  def show
    
    @place = Place.find(params[:id]) # tells controller to find coorect place by passing id of each place
    @comment = Comment.new
    @photo = Photo.new

  end


  def edit 
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end 

  end

  def update
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @place.update_attributes(place_params) # update each value in fields in database, form is already set up to hook up to place_params 
    
    if @place.valid?
      redirect_to root_path
    else 
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    
    @place.destroy
    redirect_to root_path    
  end


  private 

  def place_params
    params.require(:place).permit(:name, :description, :address) # pulls values from place FORM
  end

end
