class HomeController < ApplicationController

  def index
  	prepare_vars
  end

  def query
  	# Set up default values for the data object and result limit
  	if !params[:q]
	  	params[:q] = "IcustayDetail"
	end
	if !params[:n]
		# Default limit of 20
		@query_limit = 20
	else
		# For the moment we will just set a static limit
		@query_limit = 20
	end

	@data = IcustayDetail.where(params[:icustay_detail])

	if !params[:medevents].blank?
		meds = Ioevent.where(params[:medevents])
		@data = @data.where{icustay_id.in(meds.select{icustay_id})}
	end

	if !params[:labevents].blank?
		labs = Labevent.where(params[:labevents])
		@data = @data.where{icustay_id.in(labs.select{icustay_id})}
	end

	if !params[:icd_codes].blank?
		# Swap out the "IN" or "NOT IN" for "SIMILAR TO" or "NOT SIMILAR TO",
		# because the latter two operators support wildcards (e.g. 428.%)
		c1 = params[:icd_codes].gsub! ' IN(', ' SIMILAR TO('

		# Alter the format of the bracket() contents from ('428.0', '428.1')
		# to conform to SIMILAR TO's format of ('(428.0|428.1')'
		c2 = c1.gsub! '\', \'', '|'

		# Check whether gsub failed to find ', ' in params[:icd_codes]
		# (i.e. there was only one ICD term supplied by the user), in which
		# case gsub returns nil
		if c2.blank?
			# Resort back to the original ('428.0') format, which is
			# acceptable as long as there is only one term
			c2 = c1
		end

		icd_diag = DiagnosisIcd.where(c2)
		@data = @data.where{hadm_id.in(icd_diag.select{hadm_id})}

		# TO BE IMPLEMENTED
		# icd_proc = ProcedureIcd.where(c2)
		# @data = @data.where{hadm_id.in(icd_proc.select{hadm_id})}
	end

	if (params[:distinct] != "null")
		d = JSON.parse(params[:distinct])
		@distincts = []
		d.each do |p|
			# Perform a join, if needed
			if (!p[0].blank?)
				@distinct_data = @data.joins(p[0].to_sym)
			else
				@distinct_data = @data
			end

			# Select the column we want to be distinct
			@distincts.push([p[1], @distinct_data.pluck('DISTINCT ' + p[1]).count])
		end
	end

	if (params[:aggregate] != "null")
		a = JSON.parse(params[:aggregate])
		@aggregates = []
		a.each do |p|
			# Perform a join, if needed
			if (!p[0].blank?)
				@aggregate_data = @data.joins(p[0].to_sym)
			else
				@aggregate_data = @data
			end

			# Group by the column that for which we want to aggregate (break down) 
			@aggregates.push([p[1], @aggregate_data.group(p[1]).order(['count_', p[1].split('.').join('_'), ' DESC'].join).count(p[1])])
		end
	end

	if (params[:average] != "null")
		a = JSON.parse(params[:average])
		@averages = []
		a.each do |p|
			# Perform a join, if needed
			if (!p[0].blank?)
				@average_data = @data.joins(p[0].to_sym)
			else
				@average_data = @data
			end

			# Calculate() using the method passed as the first variable, on the column passed as the second variable
			@averages.push([p[1], @average_data.calculate(:average, p[1]).truncate(2).to_s])
		end
	end

	@options = params[:fields]

	render layout: false
  end

  def prepare_vars
    c = ["congestive_heart_failure",
		"cardiac_arrhythmias",
		"valvular_disease",
		"pulmonary_circulation",
		"peripheral_vascular",
		"hypertension",
		"paralysis",
		"other_neurological",
		"chronic_pulmonary",
		"diabetes_uncomplicated",
		"diabetes_complicated",
		"hypothyroidism",
		"renal_failure",
		"liver_disease",
		"peptic_ulcer",
		"aids",
		"lymphoma",
		"metastatic_cancer",
		"solid_tumor",
		"rheumatoid_arthritis",
		"coagulopathy",
		"obesity",
		"weight_loss",
		"fluid_electrolyte",
		"blood_loss_anemia",
		"deficiency_anemias",
		"alcohol_abuse",
		"drug_abuse",
		"psychoses",
		"depression"]

	@comorbidities = []
	c.each do |i|
		@comorbidities << [i.humanize, "hadm.comorbidity_scores." + i]
	end
  end
end
