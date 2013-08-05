class TwitterController < ApplicationController
=begin
  def show

  end

  def index

def twitter
  client = TwitterOAuth::Client.new(
  :consumer_key => 'M9ahgZ1Ywun4zBNFpMaKQ'
  :consumer_secret => 'QklD3jIr8dulF9zAAj5djTQOTmGivPHkIYkzPxlqsyo'
 )
 request_token = client.request_token(:oauth_callback => new_user_url)
 session[:request_token] = request_token
 redirect_to request_token.authorize_url
end

def new
   client = TwitterOAuth::Client.new(
      :consumer_key => 'M9ahgZ1Ywun4zBNFpMaKQ'
      :consumer_secret => 'QklD3jIr8dulF9zAAj5djTQOTmGivPHkIYkzPxlqsyo'
      )
      access_token = client.authorize(
      session[:request_token].token,
      session[:request_token].secret,
      :oauth_verifier => params[:oauth_verifier]
      )
   #For testing purpose, i tried posting a status and its working perfectly fine

 client.update('I am authorized')
end

=begin
      client = Grackle::Client.new(:auth=>{
        :type=>:oauth,
        :consumer_key=>'M9ahgZ1Ywun4zBNFpMaKQ', :consumer_secret=>'QklD3jIr8dulF9zAAj5djTQOTmGivPHkIYkzPxlqsyo',
        :token=>'802065139-bTaNE7l7WUMqw8ii9bZtNocyLJ5ZSRVSwDLxKgyM', :token_secret=>'802065139-bTaNE7l7WUMqw8ii9bZtNocyLJ5ZSRVSwDLxKgyM'
      })
    t = Twitter.new
    t = t.getJsonData
bend

  end
=end
end


