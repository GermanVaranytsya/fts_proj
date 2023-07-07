-- integrated.i_umls_in definition

-- Drop table

-- DROP TABLE integrated.i_umls_in;

CREATE TABLE integrated.i_umls_in (
	did_id varchar(10) NULL,
	src_nm varchar(10) NULL,
	src_id varchar(30) NULL,
	drug_raw_name varchar(200) NULL,
	ind_raw_value varchar(1700) NULL,
	ind_raw_target varchar(200) NULL,
	ind_raw_match varchar(15) NULL,
	ind_umls_in_term_match varchar(40) NULL,
	ind_umls_in_term varchar(80) NULL,
	ind_umls_in_pt varchar(110) NULL,
	ind_umls_in_cui varchar(20) NULL,
	ind_umls_in_term_typ varchar(25) NULL,
	ind_umls_in_sem_typ1 varchar(60) NULL,
	ind_umls_in_sem_typ2 varchar(60) NULL,
	ind_umls_in_sem_typ3 varchar(50) NULL,
	ind_umls_in_sem_typ4 varchar(50) NULL
);