module SearchHelper
  def total_genres
    
      total = 0
      @artists.each do  |artist|
        if artist.genres.present?
          artist.genres.count if artist.genres.present?
          total += artist.genres.count
        else
          total = total
        end
      end
    total
  end

  # def similar_tempo
  #     arr = []

  #     @tracks.map(&:tempo).each do |tempo|
  #       arr << tempo
  #     end

  #     @average_tempo = arr.inject(0.0) {|sum, el| sum + el}/ arr.size

  #     @similar_tracks = Track.where(:tempo => @average_tempo).entries
  # end

end
