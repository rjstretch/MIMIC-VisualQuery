class Caregiver < ActiveRecord::Base
	self.primary_key = 'cgid'

	has_many :cptevents, :class_name => "Cptevent", :foreign_key => "cgid"
	has_many :icd_diagnoses, :class_name => "DiagnosisIcd", :foreign_key => "hadm_id"
	has_many :icd_procedures, :class_name => "ProcedureIcd", :foreign_key => "hadm_id"

	has_many :datetimeevents, :class_name => "Datetimeevent", :foreign_key => "cgid"
	has_many :chartevents, :class_name => "Chartevent", :foreign_key => "cgid"
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "cgid"
	has_many :noteevents, :class_name => "Noteevent", :foreign_key => "cgid"
end
