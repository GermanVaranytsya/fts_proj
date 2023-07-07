CREATE OR REPLACE PROCEDURE stage.sp_i_umls_in()
 LANGUAGE plpgsql
AS $procedure$
BEGIN
  PERFORM 1 FROM integrated.i_umls_in LIMIT 1;
  IF FOUND THEN
    TRUNCATE TABLE integrated.i_umls_in;
  ELSE
    INSERT INTO integrated.i_umls_in (did_id, src_nm, src_id, drug_raw_name, ind_raw_value, ind_raw_target, ind_raw_match, ind_umls_in_term_match, ind_umls_in_term, ind_umls_in_pt, ind_umls_in_cui, ind_umls_in_term_typ, ind_umls_in_sem_typ1, ind_umls_in_sem_typ2, ind_umls_in_sem_typ3, ind_umls_in_sem_typ4)
    SELECT d."DID_id", d.src_nm, d.src_id, d.drug_raw_name, d.ind_raw_value, d.ind_raw_target, d.ind_raw_match, d.ind_umls_in_term_match, d.ind_umls_in_term, d.ind_umls_in_pt, d.ind_umls_in_cui, d.ind_umls_in_term_typ, d.ind_umls_in_sem_typ1, d.ind_umls_in_sem_typ2, d.ind_umls_in_sem_typ3, d.ind_umls_in_sem_typ4
    FROM stage.drug_indications_database d;
  END IF;
END;
$procedure$
;
