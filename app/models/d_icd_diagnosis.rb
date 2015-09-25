class DIcdDiagnosis < ActiveRecord::Base
	self.table_name = "d_icd_diagnoses"

	has_many :diagnoses, :class_name => "DiagnosisIcd", :foreign_key => "icd9_code"
end