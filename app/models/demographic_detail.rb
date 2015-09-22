class DemographicDetail < ActiveRecord::Base
	self.table_name = "demographic_detail"
	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"

	belongs_to :marital_status_item, :class_name => "DDemographicitem", :foreign_key => "marital_status_itemid"
	belongs_to :ethnicity_item, :class_name => "DDemographicitem", :foreign_key => "ethnicity_itemid"
	belongs_to :overall_payor_group_item, :class_name => "DDemographicitem", :foreign_key => "overall_payor_group_itemid"
	belongs_to :religion_item, :class_name => "DDemographicitem", :foreign_key => "religion_itemid"
	belongs_to :admission_type_item, :class_name => "DDemographicitem", :foreign_key => "admission_type_itemid"
	belongs_to :admission_source_item, :class_name => "DDemographicitem", :foreign_key => "admission_source_itemid"
end
