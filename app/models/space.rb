class Space < ActiveRecord::Base
	validates :address, presence: true
	geocoded_by :address
	after_validation :geocode

	has_many :users


	
end