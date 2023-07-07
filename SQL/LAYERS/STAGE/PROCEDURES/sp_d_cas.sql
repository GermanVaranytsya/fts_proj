CREATE OR REPLACE PROCEDURE stage.sp_d_cas()
 LANGUAGE plpgsql
AS $procedure$
BEGIN
  PERFORM 1 FROM integrated.d_cas LIMIT 1;
  IF FOUND THEN
    TRUNCATE TABLE integrated.d_cas;
  ELSE
    INSERT INTO integrated.d_cas (did_id, src_nm, src_id, drug_raw_name, cas_cas_no, cas_pt, cas_source, cas_match)
    SELECT d."DID_id", d.src_nm, d.src_id, d.drug_raw_name, d.cas_cas_no, d.cas_pt, d.cas_source, d.cas_match
    FROM stage.drug_indications_database d;
  END IF;
END;
$procedure$
;
