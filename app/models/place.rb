# == Schema Information
#
# Table name: places
#
#  id                :integer          not null, primary key
#  place             :string(255)
#  start_date        :date
#  end_date          :date
#  latitude          :string(255)
#  longitude         :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  trip_id           :integer
#  previous_place_id :integer
#  next_place_id     :integer
#

class Place < ActiveRecord::Base
  attr_accessible :end_date, :latitude, :longitude, :place, :start_date, :previous_place_id, :next_place_id
  has_many :journal_entries
  has_many :images
  belongs_to :trip
  belongs_to :previous_place, :class_name => "Place", :foreign_key => :previous_place_id
  has_one :next_place, :class_name => "Place", :foreign_key => :next_place_id
  validates :place, :presence => true

	def next_places
		 [place, next_place.place] unless next_place == nil
	end

end

