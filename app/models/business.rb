class Business < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  searchkick
end
