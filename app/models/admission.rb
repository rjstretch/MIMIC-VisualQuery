class Admission < ActiveRecord::Base
	include Searchable

	self.primary_key = 'hadm_id'
	
	belongs_to :subject, :class_name => "Patient", :foreign_key => "subject_id"
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

	# Customize the JSON that is sent to Elasticsearch -- can account for relationships and associations in this manner
	# http://www.rubydoc.info/gems/elasticsearch-model/
	def as_indexed_json(options={})
		as_json(
			include: [:transfers, :services]
			#methods: [:full_name]
		)
	end
end
