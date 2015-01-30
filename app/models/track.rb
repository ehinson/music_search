
class Track
  include Mongoid::Document
  include Mongoid::Timestamps
 
  index({starred: 1})
 
  field :album_id, type: String
  field :name, type: String
  field :grid, type: String
  field :isrc, type: String
  field :artist, type: String
  field :release_type, type: String
  field :commercial_type, type: String
  field :use_type, type: String
  field :territories, type: String
  field :start_date, type: String
  field :end_date, type: String
  field :price, type: String
  field :genres, type: Array
  field :mp3_path, type: String
  field :album_art_path, type: String
  field :original_release_date, type: String
  field :parental_warning, type: Boolean
  field :artist_foreign_ids, type: Array
  # Track Attributes
  field :energy, type: Float
  field :liveness, type: Float
  field :tempo, type: Float
  field :speechiness, type: Float
  field :acousticness, type: Float
  field :instrumentalness, type: Float
  field :mode, type: Integer
  field :time_signature, type: Integer
  field :duration, type: Float
  field :loudness, type: Float
  field :valence, type: Float
  field :danceability, type: Float
  field :checked, type: Boolean
  field :hotttnesss, type: Float
  field :discovery, type: Float
  field :currency, type: Float

end