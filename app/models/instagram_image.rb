class InstagramImage

	def initialize data
		@data = data
	end

	def self.build_images(images)
		images.map{|image| new(image)}
	end

	def caption
		return @data['caption']['text'] if @data['caption']
		''
	end

	def created_time
		@data['created_time']
	end

	def low_res_url
		@data['images']['low_resolution']['url']
	end

	def high_res_url
		@data['images']['standard_resolution']['url']
	end

	def latitude
		return @data['location']['latitude'] if @data['location']['latitude']
		''
	end

	def longitude
		@data['location']['longitude'] if @data['location']['longitude']
		''
	end

end