CREATE OR REPLACE PROCEDURE stage.sp_d_chebi()
 LANGUAGE plpgsql
AS $procedure$
BEGIN
  PERFORM 1 FROM integrated.d_chebi LIMIT 1;
  IF FOUND THEN
    TRUNCATE TABLE integrated.d_chebi;
  ELSE
    INSERT INTO integrated.d_chebi (did_id, src_nm, src_id, drug_raw_name, chebi_pt, chebi_id, chebi_cas_no, chebi_match, chebi_syn, chebi_syn_match, chebi_match_aid)
    SELECT d."DID_id", d.src_nm, d.src_id, d.drug_raw_name, d.chebi_pt, d.chebi_id, d.chebi_cas_no, d.chebi_match, d.chebi_syn, d.chebi_syn_match, d.chebi_match_aid
    FROM stage.drug_indications_database d;
  END IF;
END;
$procedure$
;
