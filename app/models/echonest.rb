class Echonest
  def self.similar_artist(artist)
    echonest = YAML.load_file('config/echonest.yml') 
    @API_KEY = echonest[Rails.env]["API_KEY"]
    puts @API_KEY

    @sim = []
    
    @art = URI.encode(artist)

    open = open("http://developer.echonest.com/api/v4/artist/similar?api_key=#{@API_KEY}&name=#{@art}&format=json&results=1&start=0").read

    @similar = JSON.parse(open)
    @sim_artist = @similar['response']['artists'][0]['name']

    unless @sim.include? @sim_artist
      @sim << @sim_artist
    end

    return @sim

  end

  def self.local_artists
    @loc = []
    
    @local = JSON.parse(open("http://developer.echonest.com/api/v4/artist/search?api_key=#{@API_KEY}&format=json&artist_location=boston&bucket=artist_location").read)
    @loc_artist = @local['response']['artists']
    @loc_artist.each do |a|
      @loc << a['name']
    end
    @loc
  end

  def self.similar_track(artist)
    @similar_tracks = Track.where(:artist => artist).entries
  end

    def similar_genre(artist)
    @genres  = []
    @artist.each do |artist|
      @genres << artist.genres
    end
    @genres
  end

end