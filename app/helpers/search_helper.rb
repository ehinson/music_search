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

  def hello
    i = 5
    10.times do
      puts "hi"
      puts i
      i = i -1
    end   
  end

end
