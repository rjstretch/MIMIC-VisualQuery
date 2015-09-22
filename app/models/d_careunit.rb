class DCareunit < ActiveRecord::Base
	self.primary_key = 'cuid'

	has_many :additives, :class_name => "Additive", :foreign_key => "cuid"
	has_many :a_chartdurations, :class_name => "AChartduration", :foreign_key => "cuid"
	has_many :a_iodurations, :class_name => "AIoduration", :foreign_key => "cuid"
	has_many :a_meddurations, :class_name => "AMedduration", :foreign_key => "cuid"
	
	has_many :chartevents, :class_name => "Chartevent", :foreign_key => "cuid"
	has_many :deliveries, :class_name => "Delivery", :foreign_key => "cuid"
	
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "cuid"
	has_many :medevents, :class_name => "Medevent", :foreign_key => "cuid"
	has_many :noteevents, :class_name => "Noteevent", :foreign_key => "cuid"
	has_many :totalbalevents, :class_name => "Totalbalevent", :foreign_key => "cuid"

	# The Icustayevent table has two connections to the DCareunit table: first care unit and last care unit.
	has_many :icustayevent_first_careunits, :class_name => "Icustayevent", :foreign_key => "first_careunit"
	has_many :icustayevent_last_careunits, :class_name => "Icustayevent", :foreign_key => "last_careunit"
	
	# The Censusevent table has two connections to the DCareunit table: origin and destination care unit.
	has_many :censusevent_origins, :class_name => "Censusevent", :foreign_key => "careunit"
	has_many :censusevent_destinations, :class_name => "Censusevent", :foreign_key => "destcareunit"
end
