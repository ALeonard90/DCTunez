class Concert < ActiveRecord::Base
	belongs_to :Venue

	attr_accessor	:name,
					:headlinerName,
					:openerName,
					:date,
					:image,
					:purchaseUrl


	def self.ticketfly
		@response = HTTParty.get("http://www.ticketfly.com/api/events/upcoming.json?orgId=355")
		@events = @response["events"]
		@events.each do |concert|
			@headliner = concert["headlinersName"]
			concert["ticketPurchaseUrl"]
			concert["image"]["small1"]["path"]
			concert["startDate"]
		end

	
	end

	def self.spotify(headliner)
		@artists = RSpotify::Artist.search(@headliner)
    	@musician = @artists.first
    	@toptracks = @musician.top_tracks(:US)
   		@openspot = @musician.external_urls['spotify']
   		
	end

	# <% @events.each do |concert| %>
 #   			<h1><%= concert["headlinersName"] %></h1> 
 #   			<a href="<%= concert["ticketPurchaseUrl"] %>">Purchase Ticket</a>
 #   			<img src="<%= concert["image"][5] %>">
 #   			<%= concert["startDate"] %>
	# <% end %>

	# def initialize(attrs)
 #    attrs.each do |method, value|
 #      send("#{method}=", value) if respond_to?("#{method}=")
 #    end
 #  end


end
