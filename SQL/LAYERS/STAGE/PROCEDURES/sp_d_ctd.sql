CREATE OR REPLACE PROCEDURE stage.sp_d_ctd()
 LANGUAGE plpgsql
AS $procedure$
BEGIN
  PERFORM 1 FROM integrated.d_ctd LIMIT 1;
  IF FOUND THEN
    TRUNCATE TABLE integrated.d_ctd;
  ELSE
    INSERT INTO integrated.d_ctd (did_id, src_nm, src_id, drug_raw_name, ctd_pt, ctd_mesh_id, ctd_cas_no, ctd_match, ctd_syn, ctd_syn_match, ctd_match_aid)
    SELECT d."DID_id", d.src_nm, d.src_id, d.drug_raw_name, d.ctd_pt, d.ctd_mesh_id, d.ctd_cas_no, d.ctd_match, d.ctd_syn, d.ctd_syn_match, d.ctd_match_aid
    FROM stage.drug_indications_database d;
  END IF;
END;
$procedure$
;
