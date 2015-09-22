class IcdCode < ActiveRecord::Base 
	self.table_name = "icd9"

	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"
end
