class Icustayevent < ActiveRecord::Base
	self.primary_key = 'icustay_id'
	
	belongs_to :subject, :class_name => "Patient", :foreign_key => "subject_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"

	has_many :services, :class_name => "Service", :foreign_key => "hadm_id"
	has_many :transfers, :class_name => "Transfer", :foreign_key => "hadm_id"
	has_many :callouts, :class_name => "Callout", :foreign_key => "hadm_id"

	# DRG codes are by admission
	has_many :drgcodes, :through => :hadm, :class_name => "Drgcode", :source => "drgcodes"

	# ICD and CPT codes are by ICU Stay
	has_many :icd_diagnoses, :class_name => "DiagnosisIcd", :foreign_key => "icustay_id"
	has_many :icd_procedures, :class_name => "ProcedureIcd", :foreign_key => "icustay_id"
	has_many :cptevents, :class_name => "Cptevent", :foreign_key => "icustay_id"

	# Labevents, Noteevents, and Microbiologyevents are by admission
	has_many :labevents, :through => :hadm, :class_name => "Labevent", :source => "labevents"
	has_many :noteevents, :through => :hadm, :class_name => "Noteevent", :source => "noteevents"
	has_many :microbiologyevents, :through => :hadm, :class_name => "Microbiologyevent", :source => "microbiologyevents"

	# Chartevents, Datetimeevents, Ioevents and Prescriptions are by ICU Stay
	has_many :chartevents, :class_name => "Chartevent", :foreign_key => "icustay_id"
	has_many :datetimeevents, :class_name => "Datetimeevent", :foreign_key => "icustay_id"
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "icustay_id"
	has_many :prescriptions, :class_name => "Prescription", :foreign_key => "icustay_id"

	has_many :chartevent_items, :through => :chartevents, :class_name => "DItem", source: "item"
	has_many :datetimeevent_items, :through => :datetimeevents, :class_name => "DItem", source: "item"
	has_many :ioevent_items, :through => :ioevents, :class_name => "DItem", source: "item"
	has_many :microbiologyevent_spec_items, :through => :microbiologyevents, :class_name => "DItem", source: "spec_item"
	has_many :microbiologyevent_org_items, :through => :microbiologyevents, :class_name => "DItem", source: "org_item"
	has_many :microbiologyevent_ab_items, :through => :microbiologyevents, :class_name => "DItem", source: "ab_item"	
	has_many :labevent_items, :through => :labevents, :class_name => "DLabitem", source: "item"
end
