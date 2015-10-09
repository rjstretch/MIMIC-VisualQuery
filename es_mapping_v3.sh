curl -XDELETE http://localhost:9200/icustayevents

curl -PUT http://localhost:9200/icustayevents -d '{
   "mappings": {
      "icustayevent": {
         "properties": {
            "admission": {
               "properties": {
                  "admission_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admission_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admittime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "diagnosis": {
                     "type": "multi_field",
                     "fields" : {
                         "diagnosis" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "discharge_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dischtime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "ethnicity": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hadm_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_chartevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_ioevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "insurance": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "language": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "marital_status": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "religion": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "age": {
               "type": "long",
               "index": "not_analyzed"
            },
            "dbsource": {
               "type": "string",
               "index": "not_analyzed"
            },
            "first_careunit": {
               "type": "string",
               "index": "not_analyzed"
            },
            "first_wardid": {
               "type": "long",
               "index": "not_analyzed"
            },
            "hadm_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "icustay_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "intime": {
               "type": "date",
               "format": "dateOptionalTime"
            },
            "last_careunit": {
               "type": "string",
               "index": "not_analyzed"
            },
            "last_wardid": {
               "type": "long",
               "index": "not_analyzed"
            },
            "los": {
               "type": "double",
               "index": "not_analyzed"
            },
            "outtime": {
               "type": "date",
               "format": "dateOptionalTime"
            },
            "patient": {
               "properties": {
                  "dob": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_hosp": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_ssn": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "gender": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hospital_expire_flag": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "row_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "subject_id": {
               "type": "long",
               "index": "not_analyzed"
            }
         }
      }
   }
}'

curl -XDELETE http://localhost:9200/drgcodes

curl -PUT http://localhost:9200/drgcodes -d '{
   "mappings": {
      "drgcode": {
         "properties": {
            "admission": {
               "properties": {
                  "admission_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admission_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admittime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "diagnosis": {
                     "type": "multi_field",
                     "fields" : {
                         "diagnosis" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "discharge_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dischtime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "ethnicity": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hadm_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_chartevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_ioevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "insurance": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "language": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "marital_status": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "religion": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "age": {
               "type": "long"
            },
            "description": {
               "type": "multi_field",
               "fields" : {
                   "description" : { "type" : "string", "index" : "not_analyzed" },
                   "analyzed" : { "type" : "string", "index" : "analyzed" }
               }
            },
            "drg_code": {
               "type": "string",
               "index": "not_analyzed"
            },
            "drg_type": {
               "type": "string",
               "index": "not_analyzed"
            },
            "hadm_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "patient": {
               "properties": {
                  "dob": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_hosp": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_ssn": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "gender": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hospital_expire_flag": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "row_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "subject_id": {
               "type": "long",
               "index": "not_analyzed"
            }
         }
      }
   }
}'

curl -XDELETE http://localhost:9200/diagnosis_icds

curl -PUT http://localhost:9200/diagnosis_icds -d '{
   "mappings": {
      "diagnosis_icd": {
         "properties": {
            "admission": {
               "properties": {
                  "admission_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admission_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admittime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "diagnosis": {
                     "type": "multi_field",
                     "fields" : {
                         "diagnosis" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "discharge_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dischtime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "ethnicity": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hadm_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_chartevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_ioevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "insurance": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "language": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "marital_status": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "religion": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "age": {
               "type": "long",
               "index": "not_analyzed"
            },
            "description": {
               "type": "multi_field",
               "fields" : {
                   "description" : { "type" : "string", "index" : "not_analyzed" },
                   "analyzed" : { "type" : "string", "index" : "analyzed" }
               }
            },
            "hadm_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "icd9_code": {
               "type": "string",
               "index": "not_analyzed"
            },
            "patient": {
               "properties": {
                  "dob": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_hosp": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_ssn": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "gender": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hospital_expire_flag": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "row_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "sequence": {
               "type": "long",
               "index": "not_analyzed"
            },
            "subject_id": {
               "type": "long",
               "index": "not_analyzed"
            }
         }
      }
   }
}'

curl -XDELETE http://localhost:9200/procedure_icds

curl -PUT http://localhost:9200/procedure_icds -d '{
   "mappings": {
      "procedure_icd": {
         "properties": {
            "admission": {
               "properties": {
                  "admission_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admission_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admittime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "diagnosis": {
                     "type": "multi_field",
                     "fields" : {
                         "diagnosis" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "discharge_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dischtime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "ethnicity": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hadm_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_chartevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_ioevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "insurance": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "language": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "marital_status": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "religion": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "age": {
               "type": "long",
               "index": "not_analyzed"
            },
            "description": {
               "type": "multi_field",
               "fields" : {
                   "description" : { "type" : "string", "index" : "not_analyzed" },
                   "analyzed" : { "type" : "string", "index" : "analyzed" }
               }
            },
            "hadm_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "icd9_code": {
               "type": "string",
               "index": "not_analyzed"
            },
            "patient": {
               "properties": {
                  "dob": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_hosp": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_ssn": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "gender": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hospital_expire_flag": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "row_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "sequence": {
               "type": "long",
               "index": "not_analyzed"
            },
            "subject_id": {
               "type": "long",
               "index": "not_analyzed"
            }
         }
      }
   }
}'

curl -XDELETE http://localhost:9200/cptevents

curl -PUT http://localhost:9200/cptevents -d '{
   "mappings": {
      "cptevent": {
         "properties": {
            "admission": {
               "properties": {
                  "admission_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admission_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admittime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "diagnosis": {
                     "type": "multi_field",
                     "fields" : {
                         "diagnosis" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "discharge_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dischtime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "ethnicity": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hadm_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_chartevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_ioevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "insurance": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "language": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "marital_status": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "religion": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "age": {
               "type": "long",
               "index": "not_analyzed"
            },
            "costcenter": {
               "type": "string",
               "index": "not_analyzed"
            },
            "cpt_cd": {
               "type": "string",
               "index": "not_analyzed"
            },
            "cpt_number": {
               "type": "long",
               "index": "not_analyzed"
            },
            "cpt_suffix": {
               "type": "string",
               "index": "not_analyzed"
            },
            "description": {
               "type": "multi_field",
               "fields" : {
                   "description" : { "type" : "string", "index" : "not_analyzed" },
                   "analyzed" : { "type" : "string", "index" : "analyzed" }
               }
            },
            "hadm_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "patient": {
               "properties": {
                  "dob": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_hosp": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_ssn": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "gender": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hospital_expire_flag": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "row_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "sectionheader": {
               "type": "string",
               "index": "not_analyzed"
            },
            "subject_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "subsectionheader": {
               "type": "string",
               "index": "not_analyzed"
            },
            "ticket_id_seq": {
               "type": "long",
               "index": "not_analyzed"
            }
         }
      }
   }
}'

curl -XDELETE http://localhost:9200/transfers

curl -PUT http://localhost:9200/transfers -d '{
   "mappings": {
      "transfer": {
         "properties": {
            "admission": {
               "properties": {
                  "admission_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admission_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admittime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "diagnosis": {
                     "type": "multi_field",
                     "fields" : {
                         "diagnosis" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "discharge_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dischtime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "ethnicity": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hadm_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_chartevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_ioevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "insurance": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "language": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "marital_status": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "religion": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "age": {
               "type": "long",
               "index": "not_analyzed"
            },
            "curr_bed": {
               "type": "string",
               "index": "not_analyzed"
            },
            "curr_careunit": {
               "type": "string",
               "index": "not_analyzed"
            },
            "curr_rm": {
               "type": "string",
               "index": "not_analyzed"
            },
            "curr_ward": {
               "type": "string",
               "index": "not_analyzed"
            },
            "dbsource": {
               "type": "string",
               "index": "not_analyzed"
            },
            "eventtype": {
               "type": "string",
               "index": "not_analyzed"
            },
            "frm_bed": {
               "type": "string",
               "index": "not_analyzed"
            },
            "frm_rm": {
               "type": "string",
               "index": "not_analyzed"
            },
            "frm_ward": {
               "type": "string",
               "index": "not_analyzed"
            },
            "hadm_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "intime": {
               "type": "date",
               "format": "dateOptionalTime"
            },
            "los": {
               "type": "double",
               "index": "not_analyzed"
            },
            "outtime": {
               "type": "date",
               "format": "dateOptionalTime"
            },
            "patient": {
               "properties": {
                  "dob": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_hosp": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_ssn": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "gender": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hospital_expire_flag": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "prev_careunit": {
               "type": "string",
               "index": "not_analyzed"
            },
            "row_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "subject_id": {
               "type": "long",
               "index": "not_analyzed"
            }
         }
      }
   }
}'

curl -XDELETE http://localhost:9200/services

curl -PUT http://localhost:9200/services -d '{
   "mappings": {
      "service": {
         "properties": {
            "admission": {
               "properties": {
                  "admission_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admission_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admittime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "diagnosis": {
                     "type": "multi_field",
                     "fields" : {
                         "diagnosis" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "discharge_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dischtime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "ethnicity": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hadm_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_chartevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_ioevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "insurance": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "language": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "marital_status": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "religion": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "age": {
               "type": "long",
               "index": "not_analyzed"
            },
            "curr_service": {
               "type": "string",
               "index": "not_analyzed"
            },
            "hadm_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "patient": {
               "properties": {
                  "dob": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_hosp": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_ssn": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "gender": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hospital_expire_flag": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "prev_service": {
               "type": "string",
               "index": "not_analyzed"
            },
            "row_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "subject_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "transfertime": {
               "type": "date",
               "format": "dateOptionalTime"
            }
         }
      }
   }
}'

curl -XDELETE http://localhost:9200/microbiologyevents

curl -PUT http://localhost:9200/microbiologyevents -d '{
   "mappings": {
      "microbiologyevent": {
         "properties": {
            "ab_cd": {
               "type": "long",
               "index": "not_analyzed"
            },
            "ab_item": {
               "properties": {
                  "abbreviation": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "category": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "code": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dbsource": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "itemid": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "label": {
                     "type": "multi_field",
                     "fields" : {
                         "label" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "linksto": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "param_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "unitname": {
                     "type": "string",
                     "index": "not_analyzed"
                  }
               }
            },
            "ab_itemid": {
               "type": "long",
               "index": "not_analyzed"
            },
            "ab_name": {
               "type": "multi_field",
               "fields" : {
                   "ab_name" : { "type" : "string", "index" : "not_analyzed" },
                   "analyzed" : { "type" : "string", "index" : "analyzed" }
               }
            },
            "admission": {
               "properties": {
                  "admission_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admission_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admittime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "diagnosis": {
                     "type": "multi_field",
                     "fields" : {
                         "diagnosis" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "discharge_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dischtime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "ethnicity": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hadm_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_chartevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_ioevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "insurance": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "language": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "marital_status": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "religion": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "age": {
               "type": "long",
               "index": "not_analyzed"
            },
            "chartdate": {
               "type": "date",
               "format": "dateOptionalTime"
            },
            "charttime": {
               "type": "date",
               "format": "dateOptionalTime"
            },
            "dilution_comparison": {
               "type": "string",
               "index": "not_analyzed"
            },
            "dilution_text": {
               "type": "string",
               "index": "not_analyzed"
            },
            "dilution_value": {
               "type": "double",
               "index": "not_analyzed"
            },
            "hadm_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "interpretation": {
               "type": "string",
               "index": "not_analyzed"
            },
            "isolate_num": {
               "type": "long",
               "index": "not_analyzed"
            },
            "org_cd": {
               "type": "long",
               "index": "not_analyzed"
            },
            "org_item": {
               "properties": {
                  "abbreviation": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "category": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "code": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dbsource": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "itemid": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "label": {
                     "type": "multi_field",
                     "fields" : {
                         "label" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "linksto": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "param_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "unitname": {
                     "type": "string",
                     "index": "not_analyzed"
                  }
               }
            },
            "org_itemid": {
               "type": "long",
               "index": "not_analyzed"
            },
            "org_name": {
               "type": "string",
               "index": "not_analyzed"
            },
            "patient": {
               "properties": {
                  "dob": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_hosp": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_ssn": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "gender": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hospital_expire_flag": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "row_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "spec_item": {
               "properties": {
                  "abbreviation": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "category": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "code": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dbsource": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "itemid": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "label": {
                     "type": "multi_field",
                     "fields" : {
                         "label" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "linksto": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "param_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "unitname": {
                     "type": "string",
                     "index": "not_analyzed"
                  }
               }
            },
            "spec_itemid": {
               "type": "long",
               "index": "not_analyzed"
            },
            "spec_type_cd": {
               "type": "string",
               "index": "not_analyzed"
            },
            "spec_type_desc": {
               "type": "string",
               "index": "not_analyzed"
            },
            "subject_id": {
               "type": "long",
               "index": "not_analyzed"
            }
         }
      }
   }
}'

curl -XDELETE http://localhost:9200/labevents

curl -PUT http://localhost:9200/labevents -d '{
   "mappings": {
      "labevent": {
         "properties": {
            "admission": {
               "properties": {
                  "admission_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admission_type": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "admittime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "diagnosis": {
                     "type": "multi_field",
                     "fields" : {
                         "diagnosis" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "discharge_location": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "dischtime": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "ethnicity": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hadm_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_chartevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "has_ioevents_data": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "insurance": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "language": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "marital_status": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "religion": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "age": {
               "type": "long",
               "index": "not_analyzed"
            },
            "charttime": {
               "type": "date",
               "format": "dateOptionalTime"
            },
            "flag": {
               "type": "string",
               "index": "not_analyzed"
            },
            "hadm_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "item": {
               "properties": {
                  "category": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "fluid": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "itemid": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "label": {
                     "type": "multi_field",
                     "fields" : {
                         "label" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "loinc_code": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "itemid": {
               "type": "long",
               "index": "not_analyzed"
            },
            "patient": {
               "properties": {
                  "dob": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_hosp": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_ssn": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "gender": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hospital_expire_flag": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "row_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "subject_id": {
               "type": "long",
               "index": "not_analyzed"
            },
            "uom": {
               "type": "string",
               "index": "not_analyzed"
            },
            "value": {
               "type": "multi_field",
               "fields" : {
                   "value" : { "type" : "string", "index" : "not_analyzed" },
                   "analyzed" : { "type" : "string", "index" : "analyzed" }
               }
            },
            "valuenum": {
               "type": "double",
               "index": "not_analyzed"
            }
         }
      }
   }
}'

curl -XDELETE http://localhost:9200/admissions

curl -PUT http://localhost:9200/admissions -d '{
   "mappings": {
      "admission": {
         "properties": {
            "admission_location": {
               "type": "string",
               "index": "not_analyzed"
            },
            "admission_type": {
               "type": "string",
               "index": "not_analyzed"
            },
            "admittime": {
               "type": "date",
               "format": "dateOptionalTime"
            },
            "age": {
               "type": "long",
               "index": "not_analyzed"
            },
            "cptevents": {
               "properties": {
                  "costcenter": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "cpt_cd": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "cpt_number": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "cpt_suffix": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "description": {
                     "type": "multi_field",
                     "fields" : {
                         "description" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "hadm_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "sectionheader": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subsectionheader": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "ticket_id_seq": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "diagnosis": {
               "type": "multi_field",
               "fields" : {
                   "diagnosis" : { "type" : "string", "index" : "not_analyzed" },
                   "analyzed" : { "type" : "string", "index" : "analyzed" }
               }
            },
            "discharge_location": {
               "type": "string",
               "index": "not_analyzed"
            },
            "dischtime": {
               "type": "date",
               "format": "dateOptionalTime"
            },
            "drgcodes": {
               "properties": {
                  "description": {
                     "type": "multi_field",
                     "fields" : {
                         "description" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "drg_code": {
                     "type": "string",
                     "index" : "not_analyzed"
                  },
                  "drg_mortality": {
                     "type": "long",
                     "index" : "not_analyzed"
                  },
                  "drg_severity": {
                     "type": "long",
                     "index" : "not_analyzed"
                  },
                  "drg_type": {
                     "type": "string",
                     "index" : "not_analyzed"
                  },
                  "hadm_id": {
                     "type": "long",
                     "index" : "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index" : "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index" : "not_analyzed"
                  }
               }
            },
            "ethnicity": {
               "type": "string",
               "index" : "not_analyzed"
            },
            "hadm_id": {
               "type": "long",
               "index" : "not_analyzed"
            },
            "has_chartevents_data": {
               "type": "long",
               "index" : "not_analyzed"
            },
            "has_ioevents_data": {
               "type": "long",
               "index" : "not_analyzed"
            },
            "icd_diagnoses": {
               "properties": {
                  "description": {
                     "type": "multi_field",
                     "fields" : {
                         "description" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "hadm_id": {
                     "type": "long",
                     "index" : "not_analyzed"
                  },
                  "icd9_code": {
                     "type": "string",
                     "index" : "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index" : "not_analyzed"
                  },
                  "sequence": {
                     "type": "long",
                     "index" : "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index" : "not_analyzed"
                  }
               }
            },
            "icd_procedures": {
               "properties": {
                  "description": {
                     "type": "multi_field",
                     "fields" : {
                         "description" : { "type" : "string", "index" : "not_analyzed" },
                         "analyzed" : { "type" : "string", "index" : "analyzed" }
                     }
                  },
                  "hadm_id": {
                     "type": "long",
                     "index" : "not_analyzed"
                  },
                  "icd9_code": {
                     "type": "string",
                     "index" : "not_analyzed"
                  },
                  "proc_seq_num": {
                     "type": "long",
                     "index" : "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index" : "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index" : "not_analyzed"
                  }
               }
            },
            "insurance": {
               "type": "string",
               "index" : "not_analyzed"
            },
            "language": {
               "type": "string",
               "index" : "not_analyzed"
            },
            "marital_status": {
               "type": "string",
               "index" : "not_analyzed"
            },
            "patient": {
               "properties": {
                  "dob": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_hosp": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "dod_ssn": {
                     "type": "date",
                     "format": "dateOptionalTime"
                  },
                  "gender": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "hospital_expire_flag": {
                     "type": "string",
                     "index": "not_analyzed"
                  },
                  "row_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  },
                  "subject_id": {
                     "type": "long",
                     "index": "not_analyzed"
                  }
               }
            },
            "religion": {
               "type": "string",
               "index" : "not_analyzed"
            },
            "row_id": {
               "type": "long",
               "index" : "not_analyzed"
            },
            "subject_id": {
               "type": "long",
               "index" : "not_analyzed"
            }
         }
      }
   }
}'