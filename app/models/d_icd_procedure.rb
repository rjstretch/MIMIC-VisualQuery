class DIcdProcedure < ActiveRecord::Base
	self.table_name = "d_icd_procedures"

	has_many :procedures, :class_name => "ProcedureIcd", :foreign_key => "icd9_code"
end