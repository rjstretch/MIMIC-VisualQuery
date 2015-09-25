class DCpt < ActiveRecord::Base
	self.table_name = "d_cpt"

	has_many :cptevents, :class_name => "Cptevent", :foreign_key => "cpt_cd"
end