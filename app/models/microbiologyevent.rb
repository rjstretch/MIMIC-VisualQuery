class Microbiologyevent < ActiveRecord::Base 
	belongs_to :subject, :class_name => "Patient", :foreign_key => "subject_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"
	
	belongs_to :ab_item, :class_name => "DItem", :foreign_key => "ab_itemid"
	belongs_to :org_item, :class_name => "DItem", :foreign_key => "org_itemid"
	belongs_to :spec_item, :class_name => "DItem", :foreign_key => "spec_itemid"
end
