class Censusevent < ActiveRecord::Base 
	self.primary_key = 'census_id'
	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"
	belongs_to :icustayevent, :class_name => "Icustayevent", :foreign_key => "icustay_id"
	belongs_to :careunit, :class_name => "DCareunit", :foreign_key => "careunit"
	belongs_to :destcareunit, :class_name => "DCareunit", :foreign_key => "destcareunit"

	# INCOMPLETE: Other associations not listed in the official MIMIC schema
	belongs_to :icustay_detail, :class_name => "IcustayDetail", :foreign_key => "icustay_id"
end
