
class Album
  include Mongoid::Document
  include Mongoid::Timestamps
 
  index({starred: 1})
 
  field :name, type: String
  field :grid, type: String
  field :icpn, type: String
  field :catalog_number, type: String
  field :artist, type: String
  field :release_type, type: String
  field :commercial_type, type: String
  field :use_type, type: String
  field :territories, type: String
  field :start_date, type: String
  field :end_date, type: String
  field :price, type: String
  field :sony_content, type: String
  field :original_release_date, type: String
end