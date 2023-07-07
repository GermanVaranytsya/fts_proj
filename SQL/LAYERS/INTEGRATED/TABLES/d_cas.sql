-- integrated.d_cas definition

-- Drop table

-- DROP TABLE integrated.d_cas;

CREATE TABLE integrated.d_cas (
	did_id varchar(10) NULL,
	src_nm varchar(10) NULL,
	src_id varchar(30) NULL,
	drug_raw_name varchar(200) NULL,
	cas_cas_no varchar(20) NULL,
	cas_pt varchar(200) NULL,
	cas_source varchar(20) NULL,
	cas_match varchar(50) NULL
);