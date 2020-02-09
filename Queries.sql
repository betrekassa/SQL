SELECT 'Create views';
-- Creates a view 
CREATE OR REPLACE VIEW vw_cition
 AS
 SELECT tp.first_name as officer_first_name,
    tp.last_name as officer_last_name,
    tp2.first_name as driver_first_name,
	tp2.last_name as driver_last_name,
    tv.fee_amount,
	tc.cition_status
   FROM tbl_cition tc 
   JOIN tbl_lov_violation tv ON tc.fk_violation_id = tv.pk_violation_id
   JOIN tbl_officer tof 	ON tof.pk_officer_id = tc.fk_officer_id
   JOIN tbl_driver td		ON td.pk_driver_id = tc.fk_driver_id
   JOIN tbl_person tp   	ON tp.pk_person_id = tof.fk_person_id
   JOIN tbl_person tp2	ON tp2.pk_person_id = td.fk_person_id
   ;

-- Creates a view 
CREATE OR REPLACE VIEW vw_driver_address
 AS
 SELECT tp.first_name as driver_first_name,
    tp.last_name as driver_last_name,
    ta.address1,
	ta.address2,
	ta.city,
	ta.state,
	ta.zipcode
   FROM tbl_person tp 
   JOIN tbl_driver as td ON td.fk_person_id = tp.pk_person_id
   JOIN tbl_address as ta ON tp.pk_person_id = ta.fk_person_id
   ;

	
	--select our cition auditing 
	SELECT 'Query 1';
	
	SELECT *
	FROM public.tbl_cition_audit
	order by cition_date desc
	limit 2;
	
	SELECT 'Query 2';
	--query the cition view 
	SELECT * 
	FROM vw_cition;

	SELECT 'Query 3';
	--query the driver adress 
	SELECT *
	FROM vw_driver_address;
	
