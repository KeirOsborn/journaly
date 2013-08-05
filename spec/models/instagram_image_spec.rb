require './app/models/instagram_account'
require 'json'

describe InstagramImage do
  let(:image_data) do
  	<<-eos
  	{
	  	"caption": {
	      "text": "Inside le truc #foodtruck"
	    },
	    "created_time": "1296710327",
	    "images": {
	      "low_resolution": {
	        "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_6.jpg",
	        "width": 306,
	        "height": 306
	      },
	      "thumbnail": {
	        "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_5.jpg",
	        "width": 150,
	        "height": 150
	      },
	      "standard_resolution": {
	        "url": "http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_7.jpg",
	        "width": 612,
	        "height": 612
	      }
	    },
	    "location": {
	      "latitude": 37.778720183610183,
	      "longitude": -122.3962783813477,
	      "id": "520640",
	      "street_address": "",
	      "name": "Le Truc"
	    }
	  }
	  eos
	end

	context 'creating an image out of a hash' do
		let(:image) { InstagramImage.new(JSON.parse(image_data))}

		it 'has a caption' do
			image.caption.should eq 'Inside le truc #foodtruck'
		end

		it 'has a created_time' do
			image.created_time.should eq '1296710327'
		end

		it 'has a low_res_url' do
			image.low_res_url.should eq 'http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_6.jpg'
		end

		it 'has a high_res_url' do
			image.high_res_url.should eq 'http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_7.jpg'
		end

		it 'has a latitude' do
			image.latitude.should eq 37.778720183610183
		end

		it 'has a longitude' do
			image.longitude.should eq -122.3962783813477
		end

		it 'can be extraced from a hash with multiple images' do
			images = InstagramImage.build_images([JSON.parse(image_data), JSON.parse(image_data)])
			image = images[0]
			image.caption.should eq 'Inside le truc #foodtruck'
		end


	end
end