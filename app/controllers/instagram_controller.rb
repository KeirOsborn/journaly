class InstagramController < ApplicationController


  # All methods require authentication (either by client ID or access token).
# To get your Instagram OAuth credentials, register an app at http://instagr.am/oauth/client/register/
  def show

  end # end of def show


  def link
    trip_id, place_id = params['trip_place_id'].split('@')
    @trip = Trip.find(trip_id)
    @place = @trip.places.find(place_id)
    session[:place_id] = place_id
    session[:trip_id] = trip_id
    code = params['code']
    user =  User.find(session[:user])
    begin
      @response = RestClient.post 'https://api.instagram.com/oauth/access_token', { :code => code, :client_id => '5b67ff0b32434374a78613490678a851', :client_secret => 'cd22def96bb34ad3abc36c8f4be509d5', :grant_type => 'authorization_code', :redirect_uri => "#{request.protocol}#{request.host}:#{request.port}/instagram/link"}
      puts @response
      #@response = RestClient.get 'https://api.instagram.com/v1/users/24480272/media/recent/?access_token=24480272.f3c6d90.7eada26532fc4d8aa4ae408a904d5216'

      instagram = []# JSON.parse(@response)

      user.create_instagram_account(uid: instagram['user']['id'], token: instagram['access_token'])

      #@image = instagram[data]

      #

      #instagram[data].map{|image| InstagramImage.build_images(image) return image}
      rescue Exception => e
        puts 'boom'
        puts e.message
        puts e.inspect
    end

    @image_data = instagram.fetch('data')
    images = InstagramImage.build_images(@image_data)
    images.each{|image| Image.find_or_create_by_uri(:uri => image.high_res_url, :caption => image.caption)}

      image_array = Image.all
      @images = Image.all
      @image_urls = []
      image_array.each{|image| @image_urls << image.uri}
      puts @image_urls

=begin
    image = Image.find_or_create_by_uri()
    puts '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
    puts @response
    puts '================================================='
    puts instagram
    puts '**************************************************'
    image_data = instagram.fetch('data')
    puts image_data
    puts '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
    images = InstagramImage.build_images(image_data)
    puts '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
    puts images
    puts '******************************'
    image = images.pop
    puts image
    puts '******************************'
    puts image.caption
=end


    #puts InstagramImage.new(image).caption


    #image_array.map{|image| my_images << InstagramImage.build_images(image.to_json)}
  end

    def media
      puts "================"
      image_array = Image.all
      @image_urls = []
      image_array.each{|image| @image_urls << image.uri}
      puts @image_urls

      @trip = Trip.find(params[:trip_id])
      @place = Place.find(params[:place_id])
      @images = Image.all
      #session[:user] = @user.id
      #redirect_to user_path(@user)
    end

    def add
      puts 'hi'
      #@trip = Trip.find(params[:trip_id])
      #@place = Place.find(params[:place_id])
      image_array = Image.all
      image_array.each{|image| image.update_attribute(:place, Place.find(session[:place_id]))}


      @trip = Trip.find(session[:trip_id])
      @place = @trip.places.find(session[:place_id])

      redirect_to trip_place_path(@trip, @place)
    end

    def add_image
      @trip = Trip.find(params[:trip_id])
      @place = Place.find(params[:place_id])
      image = Image.find(params[:id])
      image.update_attribute(:place, @place)
      redirect_to trip_place_path(@trip, @place)
    end
end

#   def recent_instagram_media(user)
#     RestClient.get "https://api.instagram.com/v1/users/#{user.instagram_id}/media/recent/?access_token=#{user.instagramm_access_token}"

#   end

# end
# Step One: Direct your user to our authorization URL
# https://api.instagram.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=code

# Step Two: Receive the redirect from Instagram
# http://your-redirect-uri?code=CODE

# Step Three: Request the access_token
