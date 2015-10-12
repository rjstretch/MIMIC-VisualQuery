class Callout < ActiveRecord::Base
	self.table_name = "callout"

	belongs_to :patient, :class_name => "Patient", :foreign_key => "subject_id"
	belongs_to :admission, :class_name => "Admission", :foreign_key => "hadm_id"
end
