class DPatient < ActiveRecord::Base 
	self.primary_key = 'subject_id'

	has_many :additives, :class_name => "Additive", :foreign_key => "subject_id"
	has_many :admissions, :class_name => "Admission", :foreign_key => "subject_id"
	has_many :a_chartdurations, :class_name => "AChartduration", :foreign_key => "subject_id"
	has_many :a_iodurations, :class_name => "AIoduration", :foreign_key => "subject_id"
	has_many :a_meddurations, :class_name => "AMedduration", :foreign_key => "subject_id"
	has_many :censusevents, :class_name => "Censusevent", :foreign_key => "subject_id"
	has_many :chartevents, :class_name => "Chartevent", :foreign_key => "subject_id"
	has_many :deliveries, :class_name => "Delivery", :foreign_key => "subject_id"
	has_many :demographicevents, :class_name => "Demographicevent", :foreign_key => "subject_id"
	has_many :drgevents, :class_name => "Drgevent", :foreign_key => "subject_id"
	
	has_many :icd_codes, :class_name => "IcdCode", :foreign_key => "subject_id"

	has_many :icustayevents, :class_name => "Icustayevent", :foreign_key => "subject_id"
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "subject_id"
	has_many :labevents, :class_name => "Labevent", :foreign_key => "subject_id"
	has_many :medevents, :class_name => "Medevent", :foreign_key => "subject_id"
	has_many :microbiologyevents, :class_name => "Microbiologyevent", :foreign_key => "subject_id"
	has_many :noteevents, :class_name => "Noteevent", :foreign_key => "subject_id"
	
	has_many :poe_orders, :class_name => "PoeOrder", :foreign_key => "subject_id"

	has_many :procedureevents, :class_name => "Procedureevent", :foreign_key => "subject_id"
	has_many :totalbalevents, :class_name => "Totalbalevent", :foreign_key => "subject_id"
end
