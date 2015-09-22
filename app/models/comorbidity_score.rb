class ComorbidityScore < ActiveRecord::Base 
	belongs_to :subject, :class_name => "DPatient", :foreign_key => "subject_id"
	belongs_to :hadm, :class_name => "Admission", :foreign_key => "hadm_id"

	def elixhauser_score
		score = self.congestive_heart_failure +
				self.cardiac_arrhythmias +
				self.valvular_disease +
				self.pulmonary_circulation +
				self.peripheral_vascular +
				self.hypertension +
				self.paralysis +
				self.other_neurological +
				self.chronic_pulmonary +
				self.diabetes_uncomplicated +
				self.diabetes_complicated +
				self.hypothyroidism +
				self.renal_failure +
				self.liver_disease +
				self.peptic_ulcer +
				self.aids +
				self.lymphoma +
				self.metastatic_cancer +
				self.solid_tumor +
				self.rheumatoid_arthritis +
				self.coagulopathy +
				self.obesity +
				self.weight_loss +
				self.fluid_electrolyte +
				self.blood_loss_anemia +
				self.deficiency_anemias +
				self.alcohol_abuse +
				self.drug_abuse +
				self.psychoses +
				self.depression

		return score
	end
end
