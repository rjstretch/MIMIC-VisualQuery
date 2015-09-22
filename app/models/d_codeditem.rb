class DCodeditem < ActiveRecord::Base
	# 'type' is a reserved column name in ActiveRecord but MIMIC2 
	# uses it in this table. We will force ActiveRecord to accept it.
	self.inheritance_column = :_type_disabled

	self.primary_key = 'itemid'

	has_many :drgevents, :class_name => "Drgevent", :foreign_key => "itemid"
	has_many :procedureevents, :class_name => "Procedureevent", :foreign_key => "itemid"
	
	# The Microbiologyevent table has 3 connections to the DCodeditem table.
	has_many :microbiologyevent_abs, :class_name => "Microbiologyevent", :foreign_key => "ab_itemid"
	has_many :microbiologyevent_orgs, :class_name => "Microbiologyevent", :foreign_key => "org_itemid"
	has_many :microbiologyevent_specs, :class_name => "Microbiologyevent", :foreign_key => "spec_itemid"
end
