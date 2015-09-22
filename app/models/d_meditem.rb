class DMeditem < ActiveRecord::Base 
	self.primary_key = 'itemid'

	has_many :additives, :class_name => "Additive", :foreign_key => "itemid"
	has_many :a_meddurations, :class_name => "AMedduration", :foreign_key => "itemid"
	
	# The table Medevents has 2 connections to the DMeditems table.
	has_many :medevents, :class_name => "Medevent", :foreign_key => "itemid"
	has_many :medevents_solutions, :class_name => "Medevent", :foreign_key => "solutionid"
end
