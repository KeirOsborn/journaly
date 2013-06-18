# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  start_date :date
#  end_date   :date
#

class Trip < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date
  has_many :places

  validates :name, :presence => true
  validates_date :end_date, :on_or_after => :start_date

  def available_dates
  	if !places.empty?
  		available = (start_date...end_date)
  		places.each do |place|
  			place_dates = (place.start_date...place.end_date)
  	 	available = reject_dates_from(available, place_dates)
  	 	puts available.inspect
  		end
  		return available
  	else
  		return (start_date...end_date).to_a
  	end
  end

  def reject_dates_from(dates, dates_to_reject)
  	return dates.to_a.reject do |date|
  			dates_to_reject.include? date
  	end
  end
end


