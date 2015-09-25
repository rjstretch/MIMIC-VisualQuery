class DIcdDiagnosis < ActiveRecord::Base
	self.table_name = "d_icd_diagnoses"
	self.primary_key = 'icd9_code'

	has_many :diagnoses, :class_name => "DiagnosisIcd", :foreign_key => "icd9_code"
end