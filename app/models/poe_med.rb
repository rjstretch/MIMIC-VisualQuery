class PoeMed < ActiveRecord::Base 
	self.table_name = "poe_med"
	
	belongs_to :poe_order, :class_name => "PoeOrder", :foreign_key => "poe_id"
end
