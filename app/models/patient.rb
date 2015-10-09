class Patient < ActiveRecord::Base 
	include Searchable

	self.primary_key = 'subject_id'

	has_many :admissions, :class_name => "Admission", :foreign_key => "subject_id"
	has_many :icustayevents, :class_name => "Icustayevent", :foreign_key => "subject_id"
	has_many :icustaydetails, :class_name => "Icustaydetails", :foreign_key => "subject_id"

	has_many :services, :class_name => "Service", :foreign_key => "subject_id"
	has_many :transfers, :class_name => "Transfer", :foreign_key => "subject_id"
	has_many :callouts, :class_name => "Callout", :foreign_key => "subject_id"

	has_many :drgcodes, :class_name => "Drgcode", :foreign_key => "subject_id"
	has_many :icd_diagnoses, :class_name => "DiagnosisIcd", :foreign_key => "subject_id"
	has_many :icd_procedures, :class_name => "ProcedureIcd", :foreign_key => "subject_id"
	has_many :cptevents, :class_name => "Cptevent", :foreign_key => "subject_id"

	has_many :chartevents, :class_name => "Chartevent", :foreign_key => "subject_id"
	has_many :ioevents, :class_name => "Ioevent", :foreign_key => "subject_id"
	has_many :datetimeevents, :class_name => "Datetimeevent", :foreign_key => "subject_id"
	has_many :labevents, :class_name => "Labevent", :foreign_key => "subject_id"
	has_many :microbiologyevents, :class_name => "Microbiologyevent", :foreign_key => "subject_id"
	has_many :noteevents, :class_name => "Noteevent", :foreign_key => "subject_id"
	has_many :prescriptions, :class_name => "Prescription", :foreign_key => "subject_id"

	# Customize the JSON that is sent to Elasticsearch -- can account for relationships and associations in this manner
	# http://www.rubydoc.info/gems/elasticsearch-model/
	def as_indexed_json(options={})
		as_json(
			# only: [:subject_id, :gender, :dob, :dod, :dod_hosp, :dod_ssn, :hospital_expire_flag],
			include: { 
				admissions: { 
					include: [ :transfers, :services, :icustayevents, :drgcodes, :cptevents,
						icd_diagnoses: { 
							include: [ :code ] 
						}, 
						icd_procedures: {
							include: [ :code ]
						},
						microbiologyevents: {
							include: [ :ab_item, :org_item, :spec_item ]
						}
					]
				}
			}
			#methods: [:full_name]
		)
	end
end

# Customize the document mapping
# Patient.mappings.to_hash
# => {
#      :article => {
#        :dynamic => "false",
#        :properties => {
#          :title => {
#            :type          => "string",
#            :analyzer      => "english",
#            :index_options => "offsets"
#          }
#        }
#      }
#    }

# Customize the document settings
# Patient.settings.to_hash
# { :index => { :number_of_shards => 1 } }