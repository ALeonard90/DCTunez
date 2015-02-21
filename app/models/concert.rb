class Concert < ActiveRecord::Base
	belongs_to :Venue
	has_many :artists
end
