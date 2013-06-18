class JournalEntriesController < ApplicationController

   def index
   	@place = Place.find(params[:place_id])
    @journal_entries = @place.journal_entries.all
  end

  def show
  	@place = Place.find(params[:place_id])
    @journal_entry = @place.journal_entries.find(params[:id])
  end

  def new
  	@trip = Trip.find(params[:trip_id])
  	@place = @trip.places.find(params[:place_id])
  	@journal_entry = @place.journal_entries.build
	end

  def create
  	@trip = Trip.find(params[:trip_id])
  	@place = @trip.places.find(params[:place_id])
 	  @journal_entry = @place.journal_entries.create(params[:journal_entry])
 	  redirect_to trip_place_path(@trip, @place)
  end
end
