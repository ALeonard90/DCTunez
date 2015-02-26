class ConcertController < ApplicationController
	def index
	@response = HTTParty.get("http://www.ticketfly.com/api/events/upcoming.json?orgId=355")
	@events = @response["events"]

	@parsed_events = []

	@events.each do |event|
		headliner = event["headlinersName"]
		artist = RSpotify::Artist.search(headliner).first
		artist_id = artist.nil? ? '' : artist.id

	   	@new_event = {
   			headliner: headliner,
   		    purchase_url: event["ticketPurchaseUrl"],
   		    image: event["image"]["small1"]["path"],
   		    artist: artist,
   		   	playlist: artist_id,
   		   	date: event["startDate"]
	   	}

	   	@parsed_events << @new_event
		end
		respond_to do |format|
			format.html
			format.json{render json: @parsed_events}
		end
	
   end

end