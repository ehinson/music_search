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


end
