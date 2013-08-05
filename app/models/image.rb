class Image < ActiveRecord::Base
  belongs_to :place
  attr_accessible :caption, :uri, :place
end
