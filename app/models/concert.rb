class Concert < ActiveRecord::Base
	belongs_to :Venue
	has_many :artists

	attr_accessor	:name,
								:headlinerName,
								:openerName,
								:date,
								:image,
								:purchaseUrl

	def upcoming
		@response = HTTParty.get("http://www.ticketfly.com/api/events/upcoming.json?orgId=355")
		@headliner = @response["events"][0]["headlinersName"]
    @purchase = @response["events"][0]["ticketPurchaseUrl"]
	end

	# def location
	# 	{:lat => latitude, :lon => longitude}
	# end

	# def initialize(attrs)
 #    attrs.each do |method, value|
 #      send("#{method}=", value) if respond_to?("#{method}=")
 #    end
 #  end


end
