class DDemographicitem < ActiveRecord::Base 
	self.primary_key = 'itemid'

	has_many :demographicevents, :class_name => "Demographicevent", :foreign_key => "itemid"
end
