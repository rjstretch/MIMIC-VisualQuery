class Admission < ActiveRecord::Base
	self.primary_key = 'hadm_id'
	
	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"

	has_many :comorbidity_scores, :class_name => "ComorbidityScore", :foreign_key => "hadm_id"
	has_many :drgevents, :class_name => "Drgevent", :foreign_key => "hadm_id"
	has_many :demographicevents, :class_name => "Demographicevent", :foreign_key => "hadm_id"
	has_many :icd_codes, :class_name => "IcdCode", :foreign_key => "hadm_id"
	has_many :labevents, :class_name => "Labevent", :foreign_key => "hadm_id"
	has_many :microbiologyevents, :class_name => "Microbiologyevent", :foreign_key => "hadm_id"
	has_many :noteevents, :class_name => "Noteevent", :foreign_key => "hadm_id"
	has_many :poe_orders, :class_name => "PoeOrder", :foreign_key => "hadm_id"
	has_many :procedureevents, :class_name => "Procedureevent", :foreign_key => "hadm_id"

	has_many :demographic_details, :class_name => "DemographicDetail", :foreign_key => "hadm_id"
end
