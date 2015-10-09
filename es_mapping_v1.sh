curl -XDELETE http://localhost:9200/patients

curl -PUT http://localhost:9200/patients -d '{
    "mappings" : {
        "patient" : {
            "properties" : {
                "subject_id" : { "type" : "long", "index" : "not_analyzed" },
                "gender" : { "type" : "string", "index" : "not_analyzed" },
                "dob" : { "type" : "date", "index" : "not_analyzed" },  
                "dod" : { "type" : "date", "index" : "not_analyzed" },
                "dod_hosp" : { "type" : "date", "index" : "not_analyzed" },
                "dod_ssn" : { "type" : "date", "index" : "not_analyzed" },
                "hospital_expire_flag" : { "type" : "string", "index" : "not_analyzed" },
                "admissions": {
                  "type" : "nested",
                  "_timestamp" : {
                    "enabled" : true,
                    "path" : "admittime"
                  },
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
                        "type": "date"
                     },
                     "deathtime": {
                        "type": "date"
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
                        "type": "date"
                     },
                     "ethnicity": {
                        "type": "string",
                        "index": "not_analyzed"
                     },
                     "hadm_id": {
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
                     "subject_id": {
                        "type": "long",
                        "index": "not_analyzed"
                     },
                     "transfers" : {
                        "type" : "nested",
                        "_timestamp" : {
                            "enabled" : true,
                            "path" : "intime"
                        },
                        "properties" : {
                            "subject_id" : { "type" : "long", "index" : "not_analyzed" },
                            "hadm_id" : { "type" : "long", "index" : "not_analyzed" },
                            "icustay_id" : { "type" : "long", "index" : "not_analyzed" },
                            "dbsource" : { "type" : "string", "index" : "not_analyzed" },
                            "eventtype" : { "type" : "string", "index" : "not_analyzed" },  
                            "prev_careunit" : { "type" : "string", "index" : "not_analyzed" },
                            "curr_careunit" : { "type" : "string", "index" : "not_analyzed" },
                            "frm_ward" : { "type" : "string", "index" : "not_analyzed" },
                            "frm_rm" : { "type" : "string", "index" : "not_analyzed" },
                            "frm_bed" : { "type" : "string", "index" : "not_analyzed" },
                            "curr_ward" : { "type" : "string", "index" : "not_analyzed" },
                            "curr_rm" : { "type" : "string", "index" : "not_analyzed" },
                            "curr_bed" : { "type" : "string", "index" : "not_analyzed" },
                            "intime" : { "type" : "date", "index" : "not_analyzed" },
                            "outtime" : { "type" : "date", "index" : "not_analyzed" },
                            "los" : { "type" : "double", "index" : "not_analyzed" }
                        }
                    },
                    "services" : {
                        "type" : "nested",
                        "_timestamp" : {
                            "enabled" : true,
                            "path" : "transfertime"
                        },
                        "properties" : {
                            "subject_id" : { "type" : "long", "index" : "not_analyzed" },
                            "hadm_id" : { "type" : "long", "index" : "not_analyzed" },
                            "prev_service" : { "type" : "string", "index" : "not_analyzed" },
                            "curr_service" : { "type" : "string", "index" : "not_analyzed" },
                            "transfertime" : { "type" : "date", "index" : "not_analyzed" }
                        }
                    },
                    "drgcodes" : {
                        "type" : "nested",
                        "properties" : {
                            "row_id" : { "type" : "long", "index" : "not_analyzed" },
                            "subject_id" : { "type" : "long", "index" : "not_analyzed" },
                            "hadm_id" : { "type" : "long", "index" : "not_analyzed" },
                            "drg_type" : { "type" : "string", "index" : "not_analyzed" },
                            "drg_code" : { "type" : "string", "index" : "not_analyzed" },  
                            "drg_severity" : { "type" : "long", "index" : "not_analyzed" },
                            "drg_mortality" : { "type" : "long", "index" : "not_analyzed" },
                            "description" : { 
                                "type" : "multi_field", 
                                "fields" : {
                                    "description" : { "type" : "string", "index" : "not_analyzed" },
                                    "analyzed" : { "type" : "string", "index" : "analyzed" }
                                }
                            }
                        }
                    },
                    "cptevents" : {
                        "type" : "nested",
                        "properties" : {
                            "row_id" : { "type" : "long", "index" : "not_analyzed" },
                            "subject_id" : { "type" : "long", "index" : "not_analyzed" },
                            "hadm_id" : { "type" : "long", "index" : "not_analyzed" },
                            "costcenter" : { "type" : "string", "index" : "not_analyzed" },
                            "chartdate" : { "type" : "date", "index" : "not_analyzed" },
                            "cpt_cd" : { "type" : "string", "index" : "not_analyzed" },
                            "cpt_number" : { "type" : "long", "index" : "not_analyzed" },
                            "cpt_suffix" : { "type" : "string", "index" : "not_analyzed" },
                            "ticket_id_seq" : { "type" : "long", "index" : "not_analyzed" },
                            "sectionheader" : { 
                                "type" : "multi_field", 
                                "fields" : {
                                    "sectionheader" : { "type" : "string", "index" : "not_analyzed" },
                                    "analyzed" : { "type" : "string", "index" : "analyzed" }
                                }
                            },
                            "subsectionheader" : { 
                                "type" : "multi_field", 
                                "fields" : {
                                    "subsectionheader" : { "type" : "string", "index" : "not_analyzed" },
                                    "analyzed" : { "type" : "string", "index" : "analyzed" }
                                }
                            },
                            "description" : { 
                                "type" : "multi_field", 
                                "fields" : {
                                    "description" : { "type" : "string", "index" : "not_analyzed" },
                                    "analyzed" : { "type" : "string", "index" : "analyzed" }
                                }
                            }
                        }
                    },
                    "icd_diagnoses" : {
                        "type" : "nested",
                        "properties" : {
                            "icd9_code" : { 
                                "type" : "string",
                                "index" : "not_analyzed" 
                            },
                            "description" : { 
                                "type" : "multi_field",
                                "fields" : {
                                    "description" : { "type" : "string", "index" : "not_analyzed" },
                                    "analyzed" : { "type" : "string", "index" : "analyzed" }
                                }
                            },
                            "code": {
                              "properties": {
                                 "icd9_code": {
                                    "type": "string",
                                    "index": "not_analyzed"
                                 },
                                 "long_title": {
                                    "type": "multi_field",
                                    "fields" : {
                                        "long_title" : { "type" : "string", "index" : "not_analyzed" },
                                        "analyzed" : { "type" : "string", "index" : "analyzed" }
                                    }
                                 },
                                 "short_title": {
                                    "type": "multi_field",
                                    "fields" : {
                                        "short_title" : { "type" : "string", "index" : "not_analyzed" },
                                        "analyzed" : { "type" : "string", "index" : "analyzed" }
                                    }
                                 }
                              }
                            }
                        }
                    },
                    "icd_procedures" : {
                        "type" : "nested",
                        "properties" : {
                            "icd9_code" : { 
                                "type" : "string",
                                "index" : "not_analyzed" 
                            },
                            "description" : { 
                                "type" : "multi_field",
                                "fields" : {
                                    "description" : { "type" : "string", "index" : "not_analyzed" },
                                    "analyzed" : { "type" : "string", "index" : "analyzed" }
                                }
                            },
                            "code": {
                              "properties": {
                                 "icd9_code": {
                                    "type": "string",
                                    "index": "not_analyzed"
                                 },
                                 "long_title": {
                                    "type": "multi_field",
                                    "fields" : {
                                        "long_title" : { "type" : "string", "index" : "not_analyzed" },
                                        "analyzed" : { "type" : "string", "index" : "analyzed" }
                                    }
                                 },
                                 "short_title": {
                                    "type": "multi_field",
                                    "fields" : {
                                        "short_title" : { "type" : "string", "index" : "not_analyzed" },
                                        "analyzed" : { "type" : "string", "index" : "analyzed" }
                                    }
                                 }
                              }
                            }
                        }
                    },
                    "microbiologyevents" : {
                        "type" : "nested",
                        "properties" : {
                            "row_id" : { "type" : "long", "index" : "not_analyzed" },
                            "subject_id" : { "type" : "long", "index" : "not_analyzed" },
                            "hadm_id" : { "type" : "long", "index" : "not_analyzed" },
                            "drg_type" : { "type" : "string", "index" : "not_analyzed" },
                            "drg_code" : { "type" : "string", "index" : "not_analyzed" },  
                            "drg_severity" : { "type" : "long", "index" : "not_analyzed" },
                            "drg_mortality" : { "type" : "long", "index" : "not_analyzed" },
                            "description" : { 
                                "type" : "multi_field", 
                                "fields" : {
                                    "description" : { "type" : "string", "index" : "not_analyzed" },
                                    "analyzed" : { "type" : "string", "index" : "analyzed" }
                                }
                            }
                        }
                    },
                    "icustayevents" : {
                        "type" : "nested",
                        "_timestamp" : {
                            "enabled" : true,
                            "path" : "intime"
                        },
                        "properties" : {
                            "subject_id" : { "type" : "long", "index" : "not_analyzed" },
                            "hadm_id" : { "type" : "long", "index" : "not_analyzed" },
                            "icustay_id" : { "type" : "long", "index" : "not_analyzed" },
                            "dbsource" : { "type" : "string", "index" : "not_analyzed" },
                            "first_careunit" : { "type" : "string", "index" : "not_analyzed" },
                            "last_careunit" : { "type" : "string", "index" : "not_analyzed" },
                            "first_wardid" : { "type" : "long", "index" : "not_analyzed" },
                            "last_wardid" : { "type" : "long", "index" : "not_analyzed" },
                            "intime" : { "type" : "date", "index" : "not_analyzed" },
                            "outtime" : { "type" : "date", "index" : "not_analyzed" },
                            "los" : { "type" : "double", "index" : "not_analyzed" }
                        }
                    }
                  }
                }
            }
        }
    }
}'

curl -XDELETE http://localhost:9200/transfers

curl -PUT http://localhost:9200/transfers -d '{
    "mappings" : {
        "transfer" : {
            "_timestamp" : {
                "enabled" : true,
                "path" : "intime"
            },
            "properties" : {
                "subject_id" : { "type" : "long", "index" : "not_analyzed" },
                "hadm_id" : { "type" : "long", "index" : "not_analyzed" },
                "icustay_id" : { "type" : "long", "index" : "not_analyzed" },
                "dbsource" : { "type" : "string", "index" : "not_analyzed" },
                "eventtype" : { "type" : "string", "index" : "not_analyzed" },  
                "prev_careunit" : { "type" : "string", "index" : "not_analyzed" },
                "curr_careunit" : { "type" : "string", "index" : "not_analyzed" },
                "frm_ward" : { "type" : "string", "index" : "not_analyzed" },
                "frm_rm" : { "type" : "string", "index" : "not_analyzed" },
                "frm_bed" : { "type" : "string", "index" : "not_analyzed" },
                "curr_ward" : { "type" : "string", "index" : "not_analyzed" },
                "curr_rm" : { "type" : "string", "index" : "not_analyzed" },
                "curr_bed" : { "type" : "string", "index" : "not_analyzed" },
                "intime" : { "type" : "date", "index" : "not_analyzed" },
                "outtime" : { "type" : "date", "index" : "not_analyzed" },
                "los" : { "type" : "double", "index" : "not_analyzed" }
            }
        }
    }
}'

curl -XDELETE http://localhost:9200/services

curl -PUT http://localhost:9200/services -d '{
    "mappings" : {
        "service" : {
            "_timestamp" : {
                "enabled" : true,
                "path" : "transfertime"
            },
            "properties" : {
                "subject_id" : { "type" : "long", "index" : "not_analyzed" },
                "hadm_id" : { "type" : "long", "index" : "not_analyzed" },
                "prev_service" : { "type" : "string", "index" : "not_analyzed" },
                "curr_service" : { "type" : "string", "index" : "not_analyzed" },
                "transfertime" : { "type" : "date", "index" : "not_analyzed" }
            }
        }
    }
}'

curl -XDELETE http://localhost:9200/diagnosis_icds

curl -PUT http://localhost:9200/diagnosis_icds -d '{
    "mappings" : {
        "diagnosis_icd" : {
            "_timestamp" : {
                "enabled" : true,
                "path" : "admission.admittime"
            },
            "properties" : {
                "icd9_code" : { 
                    "type" : "string",
                    "index" : "not_analyzed" 
                },
                "description" : { 
                    "type" : "multi_field",
                    "fields" : {
                        "description" : { "type" : "string", "index" : "not_analyzed" },
                        "analyzed" : { "type" : "string", "index" : "analyzed" }
                    }
                },
                "subject": {
                    "properties": {
                        "dob": {
                            "type": "date"
                        },
                        "dod": {
                            "type": "date"
                        },
                        "dod_ssn": {
                            "type": "date"
                        },
                        "gender": {
                            "type": "string",
                            "index": "not_analyzed"
                        },
                        "hospital_expire_flag": {
                            "type": "string",
                            "index": "not_analyzed"
                        },
                        "subject_id": {
                            "type": "long",
                            "index": "not_analyzed"
                        }
                    }
                },
                "code": {
                  "properties": {
                     "icd9_code": {
                        "type": "string",
                        "index": "not_analyzed"
                     },
                     "long_title": {
                        "type": "multi_field",
                        "fields" : {
                            "long_title" : { "type" : "string", "index" : "not_analyzed" },
                            "analyzed" : { "type" : "string", "index" : "analyzed" }
                        }
                     },
                     "short_title": {
                        "type": "multi_field",
                        "fields" : {
                            "short_title" : { "type" : "string", "index" : "not_analyzed" },
                            "analyzed" : { "type" : "string", "index" : "analyzed" }
                        }
                     }
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
                        "type": "date"
                     },
                     "deathtime": {
                        "type": "date"
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
                        "type": "date"
                     },
                     "ethnicity": {
                        "type": "string",
                        "index": "not_analyzed"
                     },
                     "hadm_id": {
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
                     "subject_id": {
                        "type": "long",
                        "index": "not_analyzed"
                     }
                  }
                }
            }
        }
    }
}'