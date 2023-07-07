-- integrated.d_chemid definition

-- Drop table

-- DROP TABLE integrated.d_chemid;

CREATE TABLE integrated.d_chemid (
	did_id varchar(10) NULL,
	src_nm varchar(10) NULL,
	src_id varchar(30) NULL,
	drug_raw_name varchar(200) NULL,
	chemid_pt varchar(200) NULL,
	chemid_display_name varchar(60) NULL,
	chemid_id varchar(15) NULL,
	chemi_match varchar(50) NULL,
	chemid_syn varchar(200) NULL,
	chemid_syn_match varchar(40) NULL,
	chemid_match_aid varchar(25) NULL
);