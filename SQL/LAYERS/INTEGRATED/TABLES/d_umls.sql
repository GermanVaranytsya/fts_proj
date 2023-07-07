-- integrated.d_umls definition

-- Drop table

-- DROP TABLE integrated.d_umls;

CREATE TABLE integrated.d_umls (
	did_id varchar(10) NULL,
	src_nm varchar(10) NULL,
	src_id varchar(30) NULL,
	drug_raw_name varchar(200) NULL,
	umls_pt varchar(300) NULL,
	umls_cui varchar(10) NULL,
	umls_match varchar(50) NULL,
	umls_syn varchar(150) NULL,
	umls_syn_match varchar(30) NULL,
	umls_match_aid varchar(20) NULL,
	umls_sem_typ1 varchar(60) NULL,
	umls_sem_typ2 varchar(60) NULL,
	umls_sem_typ3 varchar(60) NULL,
	umls_sem_typ4 varchar(50) NULL
);