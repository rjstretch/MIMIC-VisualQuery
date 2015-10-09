class DiagnosisIcd < ActiveRecord::Base 
	include Searchable

	self.table_name = "diagnoses_icd"

	belongs_to :patient, :class_name => "Patient", :foreign_key => "subject_id"
	belongs_to :admission, :class_name => "Admission", :foreign_key => "hadm_id"

	belongs_to :code, :class_name => "DIcdDiagnosis", :foreign_key => "icd9_code"

	# Customize the JSON that is sent to Elasticsearch -- can account for relationships and associations in this manner
	# http://www.rubydoc.info/gems/elasticsearch-model/
	def as_indexed_json(options={})
		as_json(
			# only: [:icd9_code, :description],
			include: [:patient, :admission],
			methods: [:age, :short_title, :long_title]
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

	def short_title
		c = self.code
		if !c.blank?
			return c.short_title
		else
			return nil
		end
	end

	def long_title
		c = self.code
		if !c.blank?
			return c.long_title
		else
			return nil
		end
	end
end

# Customize the document mapping
# Patient.mappings.to_hash
# => {
#      :article => {
#        :dynamic => "false",
#        :properties => {
#          :title => {
#            :type          => "string",
#            :analyzer      => "english",
#            :index_options => "offsets"
#          }
#        }
#      }
#    }

# Customize the document settings
# Patient.settings.to_hash
# { :index => { :number_of_shards => 1 } }