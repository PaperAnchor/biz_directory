class Business < ActiveRecord::Base
  belongs_to :category
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  searchkick
end
