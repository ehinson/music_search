class Artist
  include Mongoid::Document
  include Mongoid::Timestamps
 
  index({starred: 1})
 
  field :name, type: String
  field :hotttnesss, type: Float
  field :genres, type: Array
  field :songs, type: Array
end