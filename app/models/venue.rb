class Venue < ActiveRecord::Base
	has_many :concerts

	def location
		{:lat => latitude, :lon => longitude}
	end
end