class SearchController < ApplicationController
  helper_method :add_results
  def index

  end

  def new

  end

  def create
    @artists = Artist.where(:name => params['search']['artist'] )
    @tracks = Track.where(:artist => params['search']['artist']).entries
    @albums = Album.where(:artist => params['search']['artist']).entries
  
  end

  def show


  end
  
  def add_results
    @artists.count + @tracks.count + @albums.count
  end

end
