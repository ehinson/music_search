module ApplicationHelper
  
  def similar_artist(artist)
    @similar = JSON.parse(open(URI.encode("http://developer.echonest.com/api/v4/artist/similar?api_key=<%= ENV['API_KEY']%>&name=#{artist}&format=json&results=1&start=0")).read)
    @sim_artist = @similar['response']['artists'][0]['name']
    unless @sim.include? @sim_artist
      @sim << @sim_artist
    end 
    while @sim.length < 2
      similar_artist(@sim_artist)
    end
    return @sim
  end  

  def similar_track(artist)
    @similar_tracks = Track.where(:artist => artist).entries
  end

  def similar_genre(artist)
    @genres  = []
    @artist.each do |artist|
      @genres << artist.genres
    end
    @genres
  end

  def local_artists
    @loc = []
    @local = JSON.parse(open(URI.encode("http://developer.echonest.com/api/v4/artist/search?api_key=<%= ENV['API_KEY']%>&format=json&artist_location=boston&bucket=artist_location")).read)
    @loc_artist = @local['response']['artists']
    @loc_artist.each do |a|
      @loc << a['name']
    end
    @loc
  end

end
