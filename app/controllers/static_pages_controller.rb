class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:about_us]
  before_action :user, only: [:home, :account]

  def home
    @trips = Trip.where(user_id:@user)
    @reservation = Reservation.all
    @checklists = Checklist.where(user_id:@user)
    # @checklists = Checklist.where(trip_id:@trip)
  end

  def account
  end

  def about_us
  end

  private

  def user
    @user = current_user
  end
  # TODO for cleanup and possible functionality: Are trip_params needed below?
  # If yes, then why don't we also need reservation and checklist params???
  
  # def trip_params
  #   params.require(:user).permit(:name, :description, :start_date, :end_date, :ice_id)
  # end

end
