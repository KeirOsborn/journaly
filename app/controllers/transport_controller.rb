class TransportController < ApplicationController

	def show
		@my_trip = params[:id]
		@trip = Trip.find(params[:id])
		@places = @trip.places
		@linked_places = @trip.linked_places


		#@places_array = @start.each{|place| @array << place.places_array}



	end

=begin
	def to_h(start_place,all_places)
		linked_places = []
		if start_place.next_place_id != nil
			linked_places << {"place" => start_place, "next_place" =>all_places.find(start_place.next_place_id)}
	end
		return linked_places
	end
=end


end