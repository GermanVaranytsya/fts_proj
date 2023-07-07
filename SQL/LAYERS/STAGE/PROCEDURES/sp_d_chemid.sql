CREATE OR REPLACE PROCEDURE stage.sp_d_chemid()
 LANGUAGE plpgsql
AS $procedure$
BEGIN
  PERFORM 1 FROM integrated.d_chemid LIMIT 1;
  IF FOUND THEN
    TRUNCATE TABLE integrated.d_chemid;
  ELSE
    INSERT INTO integrated.d_chemid (did_id, src_nm, src_id, drug_raw_name, chemid_pt, chemid_display_name, chemid_id, chemi_match, chemid_syn, chemid_syn_match, chemid_match_aid)
    SELECT d."DID_id", d.src_nm, d.src_id, d.drug_raw_name, d.chemid_pt, d.chemid_display_name, d.chemid_id, d.chemi_match, d.chemid_syn, d.chemid_syn_match, d.chemid_match_aid
    FROM stage.drug_indications_database d;
  END IF;
END;
$procedure$
;
