-- integrated.i_umls definition

-- Drop table

-- DROP TABLE integrated.i_umls;

CREATE TABLE integrated.i_umls (
	did_id varchar(10) NULL,
	src_nm varchar(10) NULL,
	src_id varchar(30) NULL,
	drug_raw_name varchar(200) NULL,
	ind_raw_value varchar(1700) NULL,
	ind_raw_target varchar(200) NULL,
	ind_raw_match varchar(15) NULL,
	ind_umls_entry_term_match varchar(50) NULL,
	ind_umls_entry_term varchar(100) NULL,
	ind_umls_pt varchar(100) NULL,
	und_umls_cuii varchar(15) NULL,
	ind_umls_term_typ varchar(20) NULL,
	ind_umls_pheno_flg varchar(20) NULL,
	ind_umls_sem_typ1 varchar(60) NULL,
	ind_umls_sem_typ2 varchar(60) NULL,
	ind_umls_sem_typ3 varchar(60) NULL,
	ind_umls_sem_typ4 varchar(50) NULL
);