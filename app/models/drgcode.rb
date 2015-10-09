class Drgcode < ActiveRecord::Base
	include Searchable
	
	belongs_to :patient, :class_name => "Patient", :foreign_key => "subject_id"
	belongs_to :admission, :class_name => "Admission", :foreign_key => "hadm_id"

	# Customize the JSON that is sent to Elasticsearch -- can account for relationships and associations in this manner
	# http://www.rubydoc.info/gems/elasticsearch-model/
	def as_indexed_json(options={})
		as_json(
			# only: [:subject_id, :gender, :dob, :dod, :dod_hosp, :dod_ssn, :hospital_expire_flag],
			include: [:patient, :admission],
			methods: [:age]
		)
	end

	def age
		a = self.admission
		b = self.patient
		if (!a.blank? && !b.blank?)
			return ((a.admittime - b.dob) / 1.year).round
		else
			return nil
		end
	end
end
