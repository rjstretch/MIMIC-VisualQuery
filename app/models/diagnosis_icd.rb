class DiagnosisIcd < ActiveRecord::Base 
	self.table_name = "diagnoses_icd"

	belongs_to :subject, :class_name => "Patient", :foreign_key => "subject_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"

	belongs_to :code, :class_name => "DIcdDiagnosis", :foreign_key => "icd9_code"
end
