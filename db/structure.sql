--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: mimiciii; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA mimiciii;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = mimiciii, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admissions; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE admissions (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    admittime timestamp(0) without time zone NOT NULL,
    dischtime timestamp(0) without time zone NOT NULL,
    deathtime timestamp(0) without time zone,
    admission_type character varying(50) NOT NULL,
    admission_location character varying(50) NOT NULL,
    discharge_location character varying(50) NOT NULL,
    insurance character varying(255) NOT NULL,
    language character varying(10),
    religion character varying(50),
    marital_status character varying(50),
    ethnicity character varying(200) NOT NULL,
    diagnosis character varying(255),
    has_ioevents_data smallint NOT NULL,
    has_chartevents_data smallint NOT NULL
);


--
-- Name: callout; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE callout (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    submit_wardid integer,
    submit_careunit character varying(15),
    curr_wardid integer,
    curr_careunit character varying(15),
    callout_wardid integer,
    callout_service character varying(10) NOT NULL,
    request_tele smallint NOT NULL,
    request_resp smallint NOT NULL,
    request_cdiff smallint NOT NULL,
    request_mrsa smallint NOT NULL,
    request_vre smallint NOT NULL,
    callout_status character varying(20) NOT NULL,
    callout_outcome character varying(20) NOT NULL,
    discharge_wardid integer,
    acknowledge_status character varying(20) NOT NULL,
    createtime timestamp(0) without time zone NOT NULL,
    updatetime timestamp(0) without time zone NOT NULL,
    acknowledgetime timestamp(0) without time zone,
    outcometime timestamp(0) without time zone NOT NULL,
    firstreservationtime timestamp(0) without time zone,
    currentreservationtime timestamp(0) without time zone
);


--
-- Name: caregivers; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE caregivers (
    row_id integer NOT NULL,
    cgid integer NOT NULL,
    label character varying(15),
    description character varying(30)
);


--
-- Name: chartevents; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE chartevents (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer,
    icustay_id integer,
    itemid integer,
    charttime timestamp(0) without time zone,
    storetime timestamp(0) without time zone,
    cgid integer,
    value character varying(255),
    valuenum double precision,
    uom character varying(50),
    warning integer,
    error integer,
    resultstatus character varying(50),
    stopped character varying(50)
);


--
-- Name: cptevents; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE cptevents (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    costcenter character varying(10) NOT NULL,
    chartdate timestamp(0) without time zone,
    cpt_cd character varying(10) NOT NULL,
    cpt_number integer,
    cpt_suffix character varying(5),
    ticket_id_seq integer,
    sectionheader character varying(50),
    subsectionheader character varying(255),
    description character varying(200)
);


--
-- Name: d_cpt; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE d_cpt (
    row_id integer NOT NULL,
    category smallint NOT NULL,
    sectionrange character varying(100) NOT NULL,
    sectionheader character varying(50) NOT NULL,
    subsectionrange character varying(100) NOT NULL,
    subsectionheader character varying(255) NOT NULL,
    codesuffix character varying(5),
    mincodeinsubsection integer NOT NULL,
    maxcodeinsubsection integer NOT NULL
);


--
-- Name: d_icd_diagnoses; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE d_icd_diagnoses (
    row_id integer NOT NULL,
    icd9_code character varying(10) NOT NULL,
    short_title character varying(50) NOT NULL,
    long_title character varying(255) NOT NULL
);


--
-- Name: d_icd_procedures; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE d_icd_procedures (
    row_id integer NOT NULL,
    icd9_code character varying(10) NOT NULL,
    short_title character varying(50) NOT NULL,
    long_title character varying(255) NOT NULL
);


--
-- Name: d_items; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE d_items (
    row_id integer NOT NULL,
    itemid integer NOT NULL,
    label character varying(200),
    abbreviation character varying(100),
    dbsource character varying(20),
    linksto character varying(50),
    code character varying(20),
    category character varying(100),
    unitname character varying(100),
    param_type character varying(30),
    lownormalvalue double precision,
    highnormalvalue double precision
);


--
-- Name: d_labitems; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE d_labitems (
    row_id integer NOT NULL,
    itemid integer NOT NULL,
    label character varying(100) NOT NULL,
    fluid character varying(100) NOT NULL,
    category character varying(100) NOT NULL,
    loinc_code character varying(100)
);


--
-- Name: datetimeevents; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE datetimeevents (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer,
    icustay_id integer,
    itemid integer NOT NULL,
    charttime timestamp(0) without time zone NOT NULL,
    storetime timestamp(0) without time zone NOT NULL,
    cgid integer NOT NULL,
    value timestamp(0) without time zone,
    uom character varying(50) NOT NULL,
    warning smallint,
    error smallint,
    resultstatus character varying(50),
    stopped character varying(50)
);


--
-- Name: diagnoses_icd; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE diagnoses_icd (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    sequence integer,
    icd9_code character varying(20),
    description character varying(50)
);


--
-- Name: drgcodes; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE drgcodes (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    drg_type character varying(20) NOT NULL,
    drg_code character varying(20) NOT NULL,
    description character varying(255),
    drg_severity smallint,
    drg_mortality smallint
);


--
-- Name: icustayevents; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE icustayevents (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    icustay_id integer NOT NULL,
    dbsource character varying(20) NOT NULL,
    first_careunit character varying(20) NOT NULL,
    last_careunit character varying(20) NOT NULL,
    first_wardid smallint NOT NULL,
    last_wardid smallint NOT NULL,
    intime timestamp(0) without time zone NOT NULL,
    outtime timestamp(0) without time zone,
    los double precision
);


--
-- Name: ioevents; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE ioevents (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer,
    icustay_id integer,
    starttime timestamp(0) without time zone,
    endtime timestamp(0) without time zone,
    itemid integer,
    volume double precision,
    volumeuom character varying(30),
    rate double precision,
    rateuom character varying(30),
    storetime timestamp(0) without time zone,
    cgid bigint,
    orderid bigint,
    linkorderid bigint,
    ordercategoryname character varying(100),
    secondaryordercategoryname character varying(100),
    ordercomponenttypedescription character varying(200),
    ordercategorydescription character varying(50),
    patientweight double precision,
    totalvolume double precision,
    totalvolumeuom character varying(50),
    statusdescription character varying(30),
    stopped character varying(30),
    newbottle integer,
    isopenbag smallint,
    continueinnextdept smallint,
    cancelreason smallint,
    comments_status character varying(30),
    comments_title character varying(100),
    comments_date timestamp(0) without time zone,
    originalcharttime timestamp(0) without time zone,
    originalamount double precision,
    originalamountuom character varying(30),
    originalroute character varying(30),
    originalrate double precision,
    originalrateuom character varying(30),
    originalsite character varying(30)
);


--
-- Name: labevents; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE labevents (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer,
    itemid integer NOT NULL,
    charttime timestamp(0) without time zone,
    value character varying(200),
    valuenum double precision,
    uom character varying(20),
    flag character varying(20)
);


--
-- Name: microbiologyevents; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE microbiologyevents (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer,
    chartdate timestamp(0) without time zone,
    charttime timestamp(0) without time zone,
    spec_itemid integer,
    spec_type_cd character varying(10),
    spec_type_desc character varying(100),
    org_itemid integer,
    org_cd integer,
    org_name character varying(100),
    isolate_num smallint,
    ab_itemid integer,
    ab_cd integer,
    ab_name character varying(30),
    dilution_text character varying(10),
    dilution_comparison character varying(20),
    dilution_value double precision,
    interpretation character varying(5)
);


--
-- Name: patients; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE patients (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    gender character varying(5) NOT NULL,
    dob timestamp(0) without time zone NOT NULL,
    dod timestamp(0) without time zone,
    dod_hosp timestamp(0) without time zone,
    dod_ssn timestamp(0) without time zone,
    hospital_expire_flag character varying(5) NOT NULL
);


--
-- Name: prescriptions; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE prescriptions (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    icustay_id integer,
    starttime timestamp(0) without time zone,
    endtime timestamp(0) without time zone,
    drug_type character varying(100) NOT NULL,
    drug character varying(100) NOT NULL,
    drug_name_poe character varying(100),
    drug_name_generic character varying(100),
    formulary_drug_cd character varying(120),
    gsn character varying(200),
    ndc character varying(120),
    prod_strength character varying(120),
    dose_val_rx character varying(120),
    dose_unit_rx character varying(120),
    form_val_disp character varying(120),
    form_unit_disp character varying(120),
    route character varying(120)
);


--
-- Name: procedures_icd; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE procedures_icd (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    proc_seq_num integer NOT NULL,
    icd9_code character varying(20) NOT NULL
);


--
-- Name: services; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE services (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    transfertime timestamp(0) without time zone NOT NULL,
    prev_service character varying(20),
    curr_service character varying(20)
);


--
-- Name: transfers; Type: TABLE; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE TABLE transfers (
    row_id integer NOT NULL,
    subject_id integer NOT NULL,
    hadm_id integer NOT NULL,
    icustay_id integer,
    dbsource character varying(20) NOT NULL,
    eventtype character varying(20),
    prev_careunit character varying(20),
    curr_careunit character varying(20),
    prev_wardid smallint,
    curr_wardid smallint,
    intime timestamp(0) without time zone,
    outtime timestamp(0) without time zone,
    los double precision
);


--
-- Name: adm_hadm_unique; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admissions
    ADD CONSTRAINT adm_hadm_unique UNIQUE (hadm_id);


--
-- Name: adm_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admissions
    ADD CONSTRAINT adm_rowid_pk PRIMARY KEY (row_id);


--
-- Name: callout_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY callout
    ADD CONSTRAINT callout_rowid_pk PRIMARY KEY (row_id);


--
-- Name: cg_cgid_unique; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY caregivers
    ADD CONSTRAINT cg_cgid_unique UNIQUE (cgid);


--
-- Name: cg_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY caregivers
    ADD CONSTRAINT cg_rowid_pk PRIMARY KEY (row_id);


--
-- Name: chartevents_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chartevents
    ADD CONSTRAINT chartevents_rowid_pk PRIMARY KEY (row_id);


--
-- Name: cpt_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cptevents
    ADD CONSTRAINT cpt_rowid_pk PRIMARY KEY (row_id);


--
-- Name: d_icd_diag_code_unique; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_icd_diagnoses
    ADD CONSTRAINT d_icd_diag_code_unique UNIQUE (icd9_code);


--
-- Name: d_icd_diag_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_icd_diagnoses
    ADD CONSTRAINT d_icd_diag_rowid_pk PRIMARY KEY (row_id);


--
-- Name: d_icd_proc_code_unique; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_icd_procedures
    ADD CONSTRAINT d_icd_proc_code_unique UNIQUE (icd9_code);


--
-- Name: d_icd_proc_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_icd_procedures
    ADD CONSTRAINT d_icd_proc_rowid_pk PRIMARY KEY (row_id);


--
-- Name: datetime_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datetimeevents
    ADD CONSTRAINT datetime_rowid_pk PRIMARY KEY (row_id);


--
-- Name: dcpt_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_cpt
    ADD CONSTRAINT dcpt_rowid_pk PRIMARY KEY (row_id);


--
-- Name: dcpt_ssrange_unique; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_cpt
    ADD CONSTRAINT dcpt_ssrange_unique UNIQUE (subsectionrange);


--
-- Name: diagnosesicd_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY diagnoses_icd
    ADD CONSTRAINT diagnosesicd_rowid_pk PRIMARY KEY (row_id);


--
-- Name: ditems_itemid_unique; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_items
    ADD CONSTRAINT ditems_itemid_unique UNIQUE (itemid);


--
-- Name: ditems_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_items
    ADD CONSTRAINT ditems_rowid_pk PRIMARY KEY (row_id);


--
-- Name: dlabitems_itemid_unique; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_labitems
    ADD CONSTRAINT dlabitems_itemid_unique UNIQUE (itemid);


--
-- Name: dlabitems_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY d_labitems
    ADD CONSTRAINT dlabitems_rowid_pk PRIMARY KEY (row_id);


--
-- Name: drg_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY drgcodes
    ADD CONSTRAINT drg_rowid_pk PRIMARY KEY (row_id);


--
-- Name: icustay_icustayid_unique; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY icustayevents
    ADD CONSTRAINT icustay_icustayid_unique UNIQUE (icustay_id);


--
-- Name: icustay_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY icustayevents
    ADD CONSTRAINT icustay_rowid_pk PRIMARY KEY (row_id);


--
-- Name: ioevents_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ioevents
    ADD CONSTRAINT ioevents_rowid_pk PRIMARY KEY (row_id);


--
-- Name: labevents_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY labevents
    ADD CONSTRAINT labevents_rowid_pk PRIMARY KEY (row_id);


--
-- Name: micro_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY microbiologyevents
    ADD CONSTRAINT micro_rowid_pk PRIMARY KEY (row_id);


--
-- Name: pat_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT pat_rowid_pk PRIMARY KEY (row_id);


--
-- Name: pat_subid_unique; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT pat_subid_unique UNIQUE (subject_id);


--
-- Name: prescription_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY prescriptions
    ADD CONSTRAINT prescription_rowid_pk PRIMARY KEY (row_id);


--
-- Name: proceduresicd_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY procedures_icd
    ADD CONSTRAINT proceduresicd_rowid_pk PRIMARY KEY (row_id);


--
-- Name: services_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_rowid_pk PRIMARY KEY (row_id);


--
-- Name: transfers_rowid_pk; Type: CONSTRAINT; Schema: mimiciii; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT transfers_rowid_pk PRIMARY KEY (row_id);


--
-- Name: admissions_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX admissions_idx01 ON admissions USING btree (subject_id, hadm_id);


--
-- Name: admissions_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX admissions_idx02 ON admissions USING btree (admittime, dischtime, deathtime);


--
-- Name: admissions_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX admissions_idx03 ON admissions USING btree (admission_type);


--
-- Name: callout_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX callout_idx01 ON callout USING btree (subject_id, hadm_id);


--
-- Name: callout_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX callout_idx02 ON callout USING btree (curr_careunit);


--
-- Name: callout_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX callout_idx03 ON callout USING btree (callout_service);


--
-- Name: callout_idx04; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX callout_idx04 ON callout USING btree (curr_wardid, callout_wardid, discharge_wardid);


--
-- Name: callout_idx05; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX callout_idx05 ON callout USING btree (callout_status, callout_outcome);


--
-- Name: callout_idx06; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX callout_idx06 ON callout USING btree (createtime, updatetime, acknowledgetime, outcometime);


--
-- Name: caregivers_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX caregivers_idx01 ON caregivers USING btree (cgid, label);


--
-- Name: chartevents_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX chartevents_idx01 ON chartevents USING btree (subject_id, hadm_id, icustay_id);


--
-- Name: chartevents_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX chartevents_idx02 ON chartevents USING btree (itemid);


--
-- Name: chartevents_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX chartevents_idx03 ON chartevents USING btree (charttime, storetime);


--
-- Name: chartevents_idx04; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX chartevents_idx04 ON chartevents USING btree (cgid);


--
-- Name: chartevents_idx05; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX chartevents_idx05 ON chartevents USING btree (value);


--
-- Name: cptevents_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX cptevents_idx01 ON cptevents USING btree (subject_id, hadm_id);


--
-- Name: cptevents_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX cptevents_idx02 ON cptevents USING btree (cpt_cd, ticket_id_seq);


--
-- Name: d_icd_diag_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX d_icd_diag_idx02 ON d_icd_diagnoses USING btree (short_title, long_title);


--
-- Name: d_icd_proc_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX d_icd_proc_idx02 ON d_icd_procedures USING btree (short_title, long_title);


--
-- Name: d_items_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX d_items_idx01 ON d_items USING btree (itemid);


--
-- Name: d_items_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX d_items_idx02 ON d_items USING btree (label, dbsource);


--
-- Name: d_items_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX d_items_idx03 ON d_items USING btree (category);


--
-- Name: d_labitems_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX d_labitems_idx01 ON d_labitems USING btree (itemid);


--
-- Name: d_labitems_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX d_labitems_idx02 ON d_labitems USING btree (label, fluid, category);


--
-- Name: d_labitems_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX d_labitems_idx03 ON d_labitems USING btree (loinc_code);


--
-- Name: datetimeevents_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX datetimeevents_idx01 ON datetimeevents USING btree (subject_id, hadm_id, icustay_id);


--
-- Name: datetimeevents_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX datetimeevents_idx02 ON datetimeevents USING btree (itemid);


--
-- Name: datetimeevents_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX datetimeevents_idx03 ON datetimeevents USING btree (charttime);


--
-- Name: datetimeevents_idx04; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX datetimeevents_idx04 ON datetimeevents USING btree (cgid);


--
-- Name: datetimeevents_idx05; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX datetimeevents_idx05 ON datetimeevents USING btree (value);


--
-- Name: diagnoses_icd_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX diagnoses_icd_idx01 ON diagnoses_icd USING btree (subject_id, hadm_id);


--
-- Name: diagnoses_icd_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX diagnoses_icd_idx02 ON diagnoses_icd USING btree (icd9_code, sequence);


--
-- Name: diagnoses_icd_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX diagnoses_icd_idx03 ON diagnoses_icd USING btree (description);


--
-- Name: drgcodes_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX drgcodes_idx01 ON drgcodes USING btree (subject_id, hadm_id);


--
-- Name: drgcodes_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX drgcodes_idx02 ON drgcodes USING btree (drg_code, drg_type);


--
-- Name: drgcodes_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX drgcodes_idx03 ON drgcodes USING btree (description, drg_severity);


--
-- Name: icustayevents_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX icustayevents_idx01 ON icustayevents USING btree (subject_id, hadm_id);


--
-- Name: icustayevents_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX icustayevents_idx02 ON icustayevents USING btree (icustay_id, dbsource);


--
-- Name: icustayevents_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX icustayevents_idx03 ON icustayevents USING btree (los);


--
-- Name: icustayevents_idx04; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX icustayevents_idx04 ON icustayevents USING btree (first_careunit);


--
-- Name: icustayevents_idx05; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX icustayevents_idx05 ON icustayevents USING btree (last_careunit);


--
-- Name: ioevents_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX ioevents_idx01 ON ioevents USING btree (subject_id, hadm_id);


--
-- Name: ioevents_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX ioevents_idx02 ON ioevents USING btree (icustay_id);


--
-- Name: ioevents_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX ioevents_idx03 ON ioevents USING btree (endtime, starttime);


--
-- Name: ioevents_idx04; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX ioevents_idx04 ON ioevents USING btree (itemid);


--
-- Name: ioevents_idx05; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX ioevents_idx05 ON ioevents USING btree (rate);


--
-- Name: ioevents_idx06; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX ioevents_idx06 ON ioevents USING btree (volume);


--
-- Name: ioevents_idx07; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX ioevents_idx07 ON ioevents USING btree (cgid);


--
-- Name: ioevents_idx08; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX ioevents_idx08 ON ioevents USING btree (linkorderid, orderid);


--
-- Name: ioevents_idx09; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX ioevents_idx09 ON ioevents USING btree (ordercategorydescription, ordercategoryname, secondaryordercategoryname);


--
-- Name: ioevents_idx10; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX ioevents_idx10 ON ioevents USING btree (ordercomponenttypedescription, ordercategorydescription);


--
-- Name: labevents_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX labevents_idx01 ON labevents USING btree (subject_id, hadm_id);


--
-- Name: labevents_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX labevents_idx02 ON labevents USING btree (itemid);


--
-- Name: labevents_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX labevents_idx03 ON labevents USING btree (charttime);


--
-- Name: labevents_idx04; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX labevents_idx04 ON labevents USING btree (value, valuenum);


--
-- Name: microbiologyevents_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX microbiologyevents_idx01 ON microbiologyevents USING btree (subject_id, hadm_id);


--
-- Name: microbiologyevents_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX microbiologyevents_idx02 ON microbiologyevents USING btree (chartdate, charttime);


--
-- Name: microbiologyevents_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX microbiologyevents_idx03 ON microbiologyevents USING btree (spec_itemid, org_itemid, ab_itemid);


--
-- Name: patients_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX patients_idx01 ON patients USING btree (hospital_expire_flag);


--
-- Name: prescriptions_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX prescriptions_idx01 ON prescriptions USING btree (subject_id, hadm_id);


--
-- Name: prescriptions_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX prescriptions_idx02 ON prescriptions USING btree (icustay_id);


--
-- Name: prescriptions_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX prescriptions_idx03 ON prescriptions USING btree (drug_type);


--
-- Name: prescriptions_idx04; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX prescriptions_idx04 ON prescriptions USING btree (drug);


--
-- Name: prescriptions_idx05; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX prescriptions_idx05 ON prescriptions USING btree (starttime, endtime);


--
-- Name: procedures_icd_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX procedures_icd_idx01 ON procedures_icd USING btree (subject_id, hadm_id);


--
-- Name: procedures_icd_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX procedures_icd_idx02 ON procedures_icd USING btree (icd9_code, proc_seq_num);


--
-- Name: services_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX services_idx01 ON services USING btree (subject_id, hadm_id);


--
-- Name: services_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX services_idx02 ON services USING btree (transfertime);


--
-- Name: services_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX services_idx03 ON services USING btree (curr_service, prev_service);


--
-- Name: transfers_idx01; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX transfers_idx01 ON transfers USING btree (subject_id, hadm_id);


--
-- Name: transfers_idx02; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX transfers_idx02 ON transfers USING btree (icustay_id);


--
-- Name: transfers_idx03; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX transfers_idx03 ON transfers USING btree (curr_careunit, prev_careunit);


--
-- Name: transfers_idx04; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX transfers_idx04 ON transfers USING btree (intime, outtime);


--
-- Name: transfers_idx05; Type: INDEX; Schema: mimiciii; Owner: -; Tablespace: 
--

CREATE INDEX transfers_idx05 ON transfers USING btree (los);


--
-- Name: admissions_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY admissions
    ADD CONSTRAINT admissions_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: callout_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY callout
    ADD CONSTRAINT callout_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: callout_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY callout
    ADD CONSTRAINT callout_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: chartevents_fk_cgid; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY chartevents
    ADD CONSTRAINT chartevents_fk_cgid FOREIGN KEY (cgid) REFERENCES caregivers(cgid);


--
-- Name: chartevents_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY chartevents
    ADD CONSTRAINT chartevents_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: chartevents_fk_icustay_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY chartevents
    ADD CONSTRAINT chartevents_fk_icustay_id FOREIGN KEY (icustay_id) REFERENCES icustayevents(icustay_id);


--
-- Name: chartevents_fk_itemid; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY chartevents
    ADD CONSTRAINT chartevents_fk_itemid FOREIGN KEY (itemid) REFERENCES d_items(itemid);


--
-- Name: chartevents_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY chartevents
    ADD CONSTRAINT chartevents_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: cptevents_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY cptevents
    ADD CONSTRAINT cptevents_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: cptevents_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY cptevents
    ADD CONSTRAINT cptevents_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: datetimeevents_fk_cgid; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY datetimeevents
    ADD CONSTRAINT datetimeevents_fk_cgid FOREIGN KEY (cgid) REFERENCES caregivers(cgid);


--
-- Name: datetimeevents_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY datetimeevents
    ADD CONSTRAINT datetimeevents_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: datetimeevents_fk_icustay_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY datetimeevents
    ADD CONSTRAINT datetimeevents_fk_icustay_id FOREIGN KEY (icustay_id) REFERENCES icustayevents(icustay_id);


--
-- Name: datetimeevents_fk_itemid; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY datetimeevents
    ADD CONSTRAINT datetimeevents_fk_itemid FOREIGN KEY (itemid) REFERENCES d_items(itemid);


--
-- Name: datetimeevents_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY datetimeevents
    ADD CONSTRAINT datetimeevents_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: diagnoses_icd_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY diagnoses_icd
    ADD CONSTRAINT diagnoses_icd_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: diagnoses_icd_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY diagnoses_icd
    ADD CONSTRAINT diagnoses_icd_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: drgcodes_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY drgcodes
    ADD CONSTRAINT drgcodes_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: drgcodes_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY drgcodes
    ADD CONSTRAINT drgcodes_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: icustayevents_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY icustayevents
    ADD CONSTRAINT icustayevents_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: icustayevents_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY icustayevents
    ADD CONSTRAINT icustayevents_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: ioevents_fk_cgid; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY ioevents
    ADD CONSTRAINT ioevents_fk_cgid FOREIGN KEY (cgid) REFERENCES caregivers(cgid);


--
-- Name: ioevents_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY ioevents
    ADD CONSTRAINT ioevents_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: ioevents_fk_icustay_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY ioevents
    ADD CONSTRAINT ioevents_fk_icustay_id FOREIGN KEY (icustay_id) REFERENCES icustayevents(icustay_id);


--
-- Name: ioevents_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY ioevents
    ADD CONSTRAINT ioevents_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: labevents_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY labevents
    ADD CONSTRAINT labevents_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: labevents_fk_itemid; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY labevents
    ADD CONSTRAINT labevents_fk_itemid FOREIGN KEY (itemid) REFERENCES d_labitems(itemid);


--
-- Name: labevents_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY labevents
    ADD CONSTRAINT labevents_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: microbiologyevents_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY microbiologyevents
    ADD CONSTRAINT microbiologyevents_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: microbiologyevents_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY microbiologyevents
    ADD CONSTRAINT microbiologyevents_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: prescriptions_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY prescriptions
    ADD CONSTRAINT prescriptions_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: prescriptions_fk_icustay_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY prescriptions
    ADD CONSTRAINT prescriptions_fk_icustay_id FOREIGN KEY (icustay_id) REFERENCES icustayevents(icustay_id);


--
-- Name: prescriptions_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY prescriptions
    ADD CONSTRAINT prescriptions_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: procedures_icd_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY procedures_icd
    ADD CONSTRAINT procedures_icd_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: procedures_icd_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY procedures_icd
    ADD CONSTRAINT procedures_icd_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: services_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: services_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: transfers_fk_hadm_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT transfers_fk_hadm_id FOREIGN KEY (hadm_id) REFERENCES admissions(hadm_id);


--
-- Name: transfers_fk_icustay_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT transfers_fk_icustay_id FOREIGN KEY (icustay_id) REFERENCES icustayevents(icustay_id);


--
-- Name: transfers_fk_subject_id; Type: FK CONSTRAINT; Schema: mimiciii; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT transfers_fk_subject_id FOREIGN KEY (subject_id) REFERENCES patients(subject_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

