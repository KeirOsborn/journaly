require 'spec_helper'

describe Trip do

	let(:today) { Date.today }
	let(:last_day) { Date.today + 10 }
	let(:trip) { Trip.new(name: 'TestTrip', start_date: today, end_date: last_day) }
	it 'has all dates available' do
		trip.available_dates.should eq (today...last_day).to_a
	end

	it 'has only a few dates available with' do
		place = Place.new(place: 'TestPlace', start_date: today, end_date: today + 3)
		trip.places<< place
		
		trip.available_dates.should eq (today+3...last_day).to_a
	end

	it 'has only a few dates available with two places' do
		trip.places<< Place.new(place: 'TestPlace', start_date: today, end_date: today + 3)
		trip.places<< Place.new(place: 'TestPlace', start_date: today+3, end_date: today + 5)
		
		trip.available_dates.should eq (today+5...last_day).to_a
	end

	it 'has only a few dates available with two places which are not adjacent' do
		trip.places<< Place.new(place: 'TestPlace', start_date: today, end_date: today + 3)
		trip.places<< Place.new(place: 'TestPlace', start_date: today+5, end_date: today + 8)
		
		trip.available_dates.should eq (today+3...today+5).to_a.concat((today+8...last_day).to_a)
	end
end