class IcustayDetail < ActiveRecord::Base
	self.table_name = "icustay_detail"
	self.primary_key = 'icustay_id'

	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"
	belongs_to :icustayevent, :class_name => "Icustayevent", :foreign_key => "icustay_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"

	has_many :medevents, :class_name => "Medevent", :foreign_key => "icustay_id"
	has_many :meddurations, :class_name => "AMedduration", :foreign_key => "icustay_id"
	has_many :medadditives, :class_name => "Additive", :foreign_key => "icustay_id"
	has_many :labevents, :class_name => "Labevent", :foreign_key => "icustay_id"
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "icustay_id"
	has_many :totalbalevents, :class_name => "Totalbalevent", :foreign_key => "icustay_id"
	has_many :censusevents, :class_name => "Censusevent", :foreign_key => "icustay_id"
	has_many :drgevents, :class_name => "Drgevent", :foreign_key => "hadm_id"
	has_many :icd_codes, :class_name => "IcdCode", :foreign_key => "hadm_id"
	# INCOMPLETE - many other tables have an ICUSTAY_ID column that can be used to link to this table.

	has_many :medevent_items, :through => :medevents, :class_name => "DMeditem", source: "item"
	has_many :labevent_items, :through => :labevents, :class_name => "DLabitem", source: "item"
end