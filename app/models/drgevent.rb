class Drgevent < ActiveRecord::Base
	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"
	belongs_to :item, :class_name => "DCodeditem", :foreign_key => "itemid"
end
