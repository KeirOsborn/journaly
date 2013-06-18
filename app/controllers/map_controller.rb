class MapController < ApplicationController


	def index
		@place = Trip.find(params[:id])
		@trip = Trip.find(params[:id])
		latitude = @trip.places.find(params[:latitude])
		longitude = @trip.places.find(params[:longitude])
	end

	def show
		@trip = Trip.find(params[:id])
		@taken_dates = @trip.taken_dates.map{|date| date.strftime("%_m-%e-%Y").strip}
		@tripId = params[:id]
		@place = Trip.find(params[:id]).places
		@markerData = []
		@place.each_index do |placeId|
			@markerData << {"name"=> @place[placeId].place, "longitude"=> @place[placeId].longitude, "latitude"=> @place[placeId].latitude, "tripId"=> @tripId, "placeId"=> @place[placeId].id, "previous_place_id"=> @place[placeId].previous_place_id, "next_place_id"=> @place[placeId].next_place_id}
		end
		@markerData = @markerData.to_json
		respond_to do |format|
			format.html
			format.json {render json: @markerData}
		end
		puts @trip.places.inspect
	end

end