class SearchController < ApplicationController
  def index

  end

  def new
    @artists = Artist.all
    @tracks = Track.all
    @albums = Album.all

  end

  def create
    @artists = Artist.where(:name => '/params['search']['artist'])
    @tracks = Track.where(:artist => 'Chris Brown')
    # @albums = Album.all


    # @artist = Artist.where(name: /^"#{params['search']['artist']}"$/)

  end

  def show
    
  end
end
