class Callout < ActiveRecord::Base
	belongs_to :subject, :class_name => "Patient", :foreign_key => "subject_id"
	belongs_to :admission, :class_name => "Admission", :foreign_key => "hadm_id"
end
