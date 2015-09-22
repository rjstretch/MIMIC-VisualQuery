class DLabitem < ActiveRecord::Base
	self.primary_key = 'itemid'

	has_many :labevents, :class_name => "Labevent", :foreign_key => "itemid"
end
