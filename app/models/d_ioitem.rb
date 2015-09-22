class DIoitem < ActiveRecord::Base
	self.primary_key = 'itemid'

	has_many :additives, :class_name => "Additive", :foreign_key => "ioitemid"
	has_many :a_iodurations, :class_name => "AIoduration", :foreign_key => "itemid"
	has_many :deliveries, :class_name => "Delivery", :foreign_key => "ioitemid"
	has_many :totalbalevents, :class_name => "Totalbalevent", :foreign_key => "itemid"
	
	# Table Ioevents has two connections to the DIoitem table: the primary IOItem ID and an alternate IOItem ID.
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "itemid"
	has_many :ioevents_alt, :class_name => "Ioevent", :foreign_key => "altid"
end
