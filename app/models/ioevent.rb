class Ioevent < ActiveRecord::Base 
	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"
	belongs_to :icustayevent, :class_name => "Icustayevent", :foreign_key => "icustay_id"
	belongs_to :ioitem, :class_name => "DIoitem", :foreign_key => "itemid"
	belongs_to :ioitem_alt, :class_name => "DIoitem", :foreign_key => "altid"
	belongs_to :cg, :class_name => "DCaregiver", :foreign_key => "cgid"
	belongs_to :cu, :class_name => "DCareunit", :foreign_key => "cuid"
end
