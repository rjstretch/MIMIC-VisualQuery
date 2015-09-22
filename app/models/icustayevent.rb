class Icustayevent < ActiveRecord::Base
	self.primary_key = 'icustay_id'
	
	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"
	belongs_to :first_careunit, :class_name => "DCareunit", :foreign_key => "first_careunit"
	belongs_to :last_careunit, :class_name => "DCareunit", :foreign_key => "last_careunit"

	has_many :additives, :class_name => "Additive", :foreign_key => "icustay_id"
	has_many :a_chartdurations, :class_name => "AChartduration", :foreign_key => "icustay_id"
	has_many :a_iodurations, :class_name => "AIoduration", :foreign_key => "icustay_id"
	has_many :a_meddurations, :class_name => "AMedduration", :foreign_key => "icustay_id"
	has_many :censusevents, :class_name => "Censusevent", :foreign_key => "icustay_id"
	has_many :chartevents, :class_name => "Chartevent", :foreign_key => "icustay_id"
	has_many :deliveries, :class_name => "Delivery", :foreign_key => "icustay_id"
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "icustay_id"
	has_many :labevents, :class_name => "Labevent", :foreign_key => "icustay_id"
	has_many :medevents, :class_name => "Medevent", :foreign_key => "icustay_id"
	has_many :noteevents, :class_name => "Noteevent", :foreign_key => "icustay_id"	
	has_many :poe_orders, :class_name => "PoeOrder", :foreign_key => "icustay_id"
	has_many :totalbalevents, :class_name => "Totalbalevent", :foreign_key => "icustay_id"
end
