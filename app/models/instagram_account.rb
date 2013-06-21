class InstagramAccount < ActiveRecord::Base
  belongs_to :user
  attr_accessible :token, :uid
end