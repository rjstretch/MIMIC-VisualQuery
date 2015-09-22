class Noteevent < ActiveRecord::Base 
	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"
	belongs_to :icustayevent, :class_name => "Icustayevent", :foreign_key => "icustay_id"
	belongs_to :cg, :class_name => "DCaregiver", :foreign_key => "cgid"
	belongs_to :cu, :class_name => "DCareunit", :foreign_key => "cuid"
end
