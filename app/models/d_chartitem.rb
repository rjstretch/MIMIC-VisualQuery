class DChartitem < ActiveRecord::Base
	self.primary_key = 'itemid'

	has_many :a_chartdurations, :class_name => "AChartduration", :foreign_key => "itemid"
	has_many :chartevents, :class_name => "Chartevent", :foreign_key => "itemid"
end
