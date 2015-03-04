class UserController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    # Create playlist in user's Spotify account
    playlist = spotify_user.create_playlist!('my-awesome-playlist')

    # Add tracks to a playlist in user's Spotify account
    tracks = RSpotify::Track.search('Know')
    playlist.add_tracks!(tracks)
    playlist.tracks.first.name #=> "Somebody That I Used To Know"

    # Access and modify user's music library
    spotify_user.save_tracks!(tracks)
    spotify_user.saved_tracks.size #=> 20
    spotify_user.remove_tracks!(tracks)

    # Use Spotify Follow features
    spotify_user.follow(playlist)
    # Check doc for more
  end

  def music
  	@response = HTTParty.get("http://www.ticketfly.com/api/events/upcoming.json?orgId=355")
	@headliner = @response["events"][0]["headlinersName"]
    @music = RSpotify::Artist.search(params[:search])
    render :json => @music
    end

end