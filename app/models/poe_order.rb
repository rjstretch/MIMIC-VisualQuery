class PoeOrder < ActiveRecord::Base 
	self.table_name = "poe_order"
	
	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"
	belongs_to :icustayevent, :class_name => "Icustayevent", :foreign_key => "icustay_id"

	has_many :poe_meds, :class_name => "PoeMed", :foreign_key => "poe_id"
end
