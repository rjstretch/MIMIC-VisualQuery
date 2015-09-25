class Cptevent < ActiveRecord::Base 
	belongs_to :subject, :class_name => "Patient", :foreign_key => "subject_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"
	belongs_to :icustayevent, :class_name => "Icustayevent", :foreign_key => "icustay_id"

	belongs_to :cpt_code, :class_name => "DCpt", :foreign_key => "cpt_cd"
	belongs_to :cg, :class_name => "Caregiver", :foreign_key => "cgid"
end
