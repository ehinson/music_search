class SearchController < ApplicationController
  helper_method :add_results
  def index

    @hotttnesss = params['search']

    @artists = Artist.where(:hotttnesss.gt => params['search'].to_f - 0.001).where(:hotttnesss.lt => params['search'].to_f + 0.001).entries
    @tracks = Track.where(:artist => params['search']['artist']).entries
    @albums = Album.where(:artist => params['search']['artist']).entries

  end

  def new

  end

  def create

    @artists = Artist.where(:name => /#{params['search']['artist']}/i).order_by([:hotttnesss, :desc])
    # @artists.map(&:name).each do |artist|
    @tracks = Track.where(:artist => /#{params['search']['artist']}/i).entries

    @albums = Album.where(:artist => /#{params['search']['artist']}/i).entries
    @genres = @artists.each do |artist|
      artist.genres
    end
    # end

  end

  def show
    @hotttnesss = params['search']
    @artists = Artist.where(:hotttnesss => @hotttnesss)
    @tracks = Track.where(:artist => params['search']['artist']).entries
    @albums = Album.where(:artist => params['search']['artist']).entries

  end
  
  def add_results
    @artists.count + @tracks.count + @albums.count + @genres.count
  end

end
