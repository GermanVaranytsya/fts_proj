CREATE OR REPLACE PROCEDURE stage.sp_d_umls()
 LANGUAGE plpgsql
AS $procedure$
BEGIN
  PERFORM 1 FROM integrated.d_umls LIMIT 1;
  IF FOUND THEN
    TRUNCATE TABLE integrated.d_umls;
  ELSE
    INSERT INTO integrated.d_umls (did_id, src_nm, src_id, drug_raw_name, umls_pt, umls_cui, umls_match, umls_syn, umls_syn_match, umls_match_aid, umls_sem_typ1, umls_sem_typ2, umls_sem_typ3, umls_sem_typ4)
    SELECT d."DID_id", d.src_nm, d.src_id, d.drug_raw_name, d.umls_pt, d.umls_cui, d.umls_match, d.umls_syn, d.umls_syn_match, d.umls_match_aid, d.umls_sem_typ1, d.umls_sem_typ2, d.umls_sem_typ3, d.umls_sem_typ4
    FROM stage.drug_indications_database d;
  END IF;
END;
$procedure$
;
