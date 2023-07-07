CREATE OR REPLACE PROCEDURE stage.sp_i_subtype()
 LANGUAGE plpgsql
AS $procedure$
BEGIN
  PERFORM 1 FROM integrated.i_subtype LIMIT 1;
  IF FOUND THEN
    TRUNCATE TABLE integrated.i_subtype;
  ELSE
    INSERT INTO integrated.i_subtype (ind_raw_value, ind_raw_target, ind_raw_match, ind_raw, ind_agg, "_ind_search")
    SELECT d.ind_raw_value, d.ind_raw_target, d.ind_raw_match, d.ind_raw, d.ind_agg, d."_ind_search"
    FROM stage.drug_indications_database d;
  END IF;
END;
$procedure$
;
