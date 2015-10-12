class ProcedureIcd < ActiveRecord::Base 
	self.table_name = "procedures_icd"

	belongs_to :patient, :class_name => "Patient", :foreign_key => "subject_id"
	belongs_to :admission, :class_name => "Admission", :foreign_key => "hadm_id"

	belongs_to :code, :class_name => "DIcdProcedure", :foreign_key => "icd9_code"
end
