class SearchController < ApplicationController
  helper_method :add_results, :similar

  require 'open-uri'
  require 'json'
  require 'yaml'
  require 'uri'

  include ApplicationHelper



  def index
    @hotttnesss = params['search']

    @artists = Artist.where(:hotttnesss.gt => params['search'].to_f - 0.001).where(:hotttnesss.lt => params['search'].to_f + 0.001).order_by([:hotttnesss, :desc]).entries
    @artist = params['artist']

    @tracks = Track.where(:artist => /#{@artist}/i).entries

    arr = []

    @tracks.map(&:tempo).each do |tempo|
      if tempo
        arr << tempo
      end
    end

    arr.delete(nil)
    @average_tempo = arr.inject {|sum, el| sum + el}.to_f / arr.size

    @sim = []
    
    @similar_artists = similar_artist(params['artist'])
    
    

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

    @artists = Artist.where(:hotttnesss.gt => params['search'].to_f - 0.001).where(:hotttnesss.lt => params['search'].to_f + 0.001).order_by([:hotttnesss, :desc]).entries
    
    @tracks = Track.where(:artist => /#{params['search']['artist']}/i).entries
  end
  
  def add_results
    @artists.count + @tracks.count + @albums.count + @genres.count
  end

  def similar
    @tracks = Track.where(:artist => /#{params['artist']}/i).entries
    @arr = []

    @tracks.map(&:tempo).each do |tempo|
        @arr << tempo
    end

    @average_tempo = @arr.inject {|sum, el| sum + el}.to_f / @arr.size

    @similar_tracks = Track.where(:tempo => @average_tempo).entries

  end

end
