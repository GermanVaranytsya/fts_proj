-- integrated.d_ctd definition

-- Drop table

-- DROP TABLE integrated.d_ctd;

CREATE TABLE integrated.d_ctd (
	did_id varchar(10) NULL,
	src_nm varchar(10) NULL,
	src_id varchar(30) NULL,
	drug_raw_name varchar(200) NULL,
	ctd_pt varchar(200) NULL,
	ctd_mesh_id varchar(15) NULL,
	ctd_cas_no varchar(15) NULL,
	ctd_match varchar(40) NULL,
	ctd_syn varchar(70) NULL,
	ctd_syn_match varchar(25) NULL,
	ctd_match_aid varchar(15) NULL
);