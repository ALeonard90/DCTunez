class MainController < ApplicationController

	def index
	@response = HTTParty.get("http://www.ticketfly.com/api/events/upcoming.json?orgId=355")
	@headliner = @response["events"][0]["headlinersName"]
    @purchase = @response["events"][0]["ticketPurchaseUrl"]
    artists = RSpotify::Artist.search(@headliner)
    musician = artists.first
    @toptracks = musician.top_tracks(:US)
	end


end