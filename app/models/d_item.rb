class DItem < ActiveRecord::Base
	self.primary_key = 'itemid'

	has_many :chartevents, :class_name => "Chartevent", :foreign_key => "itemid"
	has_many :datetimeevents, :class_name => "Datetimeevent", :foreign_key => "itemid"
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "itemid"
	has_many :noteevents, :class_name => "Noteevent", :foreign_key => "itemid"
	
	has_many :microbiology_spec_events, :class_name => "Microbiologyevent", :foreign_key => "spec_itemid"
	has_many :microbiology_org_events, :class_name => "Microbiologyevent", :foreign_key => "org_itemid"
	has_many :microbiology_ab_events, :class_name => "Microbiologyevent", :foreign_key => "ab_itemid"
end
