class DCaregiver < ActiveRecord::Base
	self.primary_key = 'cgid'
	has_many :additives, :class_name => "Additive", :foreign_key => "cgid"
	has_many :chartevents, :class_name => "Chartevent", :foreign_key => "cgid"
	has_many :deliveries, :class_name => "Delivery", :foreign_key => "cgid"
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "cgid"
	has_many :medevents, :class_name => "Medevent", :foreign_key => "cgid"
	has_many :noteevents, :class_name => "Noteevent", :foreign_key => "cgid"
	has_many :totalbalevents, :class_name => "Totalbalevent", :foreign_key => "cgid"
end
