class CommentsController < ApplicationController
  before_action :authenticate_user! # requiring user to be logged in 

  def create
    @place = Place.find(params[:place_id]) # loads place that comment belongs to
    @place.comments.create(comment_params.merge(user: current_user)) # creates new comment based on values from form 
      # merge/connect the comment with the current user that created it
    redirect_to place_path(@place)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating) # takes values from form
  end

end
