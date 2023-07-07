-- integrated.d_chebi definition

-- Drop table

-- DROP TABLE integrated.d_chebi;

CREATE TABLE integrated.d_chebi (
	did_id varchar(10) NULL,
	src_nm varchar(10) NULL,
	src_id varchar(30) NULL,
	drug_raw_name varchar(200) NULL,
	chebi_pt varchar(200) NULL,
	chebi_id int4 NULL,
	chebi_cas_no varchar(15) NULL,
	chebi_match varchar(25) NULL,
	chebi_syn varchar(110) NULL,
	chebi_syn_match varchar(25) NULL,
	chebi_match_aid varchar(20) NULL
);