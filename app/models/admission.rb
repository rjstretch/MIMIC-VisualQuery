class Admission < ActiveRecord::Base
	include Searchable

	self.primary_key = 'hadm_id'
	
	belongs_to :patient, :class_name => "Patient", :foreign_key => "subject_id"
	has_many :icustayevents, :class_name => "Icustayevent", :foreign_key => "hadm_id"
	has_many :icustaydetails, :class_name => "Icustaydetails", :foreign_key => "subject_id"
	
	has_many :services, :class_name => "Service", :foreign_key => "hadm_id"
	has_many :transfers, :class_name => "Transfer", :foreign_key => "hadm_id"
	has_many :callouts, :class_name => "Callout", :foreign_key => "hadm_id"

	has_many :drgcodes, :class_name => "Drgcode", :foreign_key => "hadm_id"
	has_many :icd_diagnoses, :class_name => "DiagnosisIcd", :foreign_key => "hadm_id"
	has_many :icd_procedures, :class_name => "ProcedureIcd", :foreign_key => "hadm_id"
	has_many :cptevents, :class_name => "Cptevent", :foreign_key => "hadm_id"

	has_many :datetimeevents, :class_name => "Datetimeevent", :foreign_key => "hadm_id"
	has_many :chartevents, :class_name => "Chartevent", :foreign_key => "hadm_id"
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "hadm_id"
	has_many :labevents, :class_name => "Labevent", :foreign_key => "hadm_id"
	has_many :microbiologyevents, :class_name => "Microbiologyevent", :foreign_key => "hadm_id"
	has_many :noteevents, :class_name => "Noteevent", :foreign_key => "hadm_id"
	has_many :prescriptions, :class_name => "Prescription", :foreign_key => "hadm_id"

	def as_indexed_json(options={})
		as_json(
			# only: [:subject_id, :gender, :dob, :dod, :dod_hosp, :dod_ssn, :hospital_expire_flag],
			include: [:patient, :drgcodes, :cptevents, :icd_diagnoses, :icd_procedures],
			methods: [:age]
		)
	end

	def age
		a = self#.admission
		b = self.patient
		if (!a.blank? && !b.blank?)
			return ((a.admittime - b.dob) / 1.year).round
		else
			return nil
		end
	end
end
