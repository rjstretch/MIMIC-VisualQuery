class Ioevent < ActiveRecord::Base 
	belongs_to :subject, :class_name => "Patient", :foreign_key => "subject_id"
	belongs_to :admission, :class_name => "Admission", :foreign_key => "hadm_id"
	belongs_to :icustayevent, :class_name => "Icustayevent", :foreign_key => "icustay_id"
	
	belongs_to :item, :class_name => "DItem", :foreign_key => "itemid"
	belongs_to :cg, :class_name => "Caregiver", :foreign_key => "cgid"
end
