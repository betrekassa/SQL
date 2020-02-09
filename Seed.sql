--clear up not to applied in production 
TRUNCATE TABLE tbl_cition;
TRUNCATE TABLE tbl_address;
TRUNCATE TABLE tbl_driver;
TRUNCATE TABLE tbl_officer;
TRUNCATE TABLE tbl_person;
TRUNCATE TABLE tbl_lov_violation;

-- populating the records
INSERT INTO tbl_person(
	pk_person_id, first_name, last_name, gender, date_of_birth)
	VALUES (1, 'MOSES', 'ALEX', 'M', '1980-08-11');	
	
INSERT INTO tbl_driver(
	pk_driver_id, fk_person_id, issued_date, expiration_date)
	VALUES (1, 1, '2000-01-10', '2010-01-10');

INSERT INTO public.tbl_person(
	pk_person_id, first_name, last_name, gender, date_of_birth)
	VALUES (3, 'SARA', 'JOHN', 'F', '1985-02-11');		

INSERT INTO public.tbl_driver(
	pk_driver_id, fk_person_id, issued_date, expiration_date)
	VALUES (2,3, '2000-01-10', '2010-01-10');

INSERT INTO public.tbl_person(
	pk_person_id, first_name, last_name, gender, date_of_birth)
	VALUES (2, 'ALMAZ', 'KEBDE', 'F', '1988-01-11');		

INSERT INTO public.tbl_officer(
	pk_officer_id, fk_person_id, tittle)
	VALUES (1, 2, 'FIRST OFFICER');


INSERT INTO public.tbl_person(
	pk_person_id, first_name, last_name, gender, date_of_birth)
	VALUES (4, 'ABEBE', 'KASSA', 'F', '1988-01-11');		

INSERT INTO public.tbl_officer(
	pk_officer_id, fk_person_id, tittle)
	VALUES (2, 4, 'FIRST OFFICER');
	

INSERT INTO public.tbl_lov_violation(
	pk_violation_id, violation_desc, fee_amount)
	VALUES (1,'not stopping on stop sign',250.00);

INSERT INTO public.tbl_lov_violation(
	pk_violation_id, violation_desc, fee_amount)
	VALUES (2,'not stopping on red light',500.00);

INSERT INTO public.tbl_lov_violation(
	pk_violation_id, violation_desc, fee_amount)
	VALUES (3,'over speeding',450.00);

INSERT INTO public.tbl_lov_violation(
	pk_violation_id, violation_desc, fee_amount)
	VALUES (4,'not stopping for school bus sign',700.00);

INSERT INTO public.tbl_cition(
	fk_driver_id, fk_officer_id, fk_violation_id, cition_date, cition_location, cition_status)
	VALUES (2, 1, 2, now(), '1st & ball str, Anaheim,CA', 'Active');

INSERT INTO public.tbl_cition(
	fk_driver_id, fk_officer_id, fk_violation_id, cition_date, cition_location, cition_status)
	VALUES (1, 2, 1, now(), '1st & ball str, Anaheim,CA', 'Active');

INSERT INTO public.tbl_cition(
	fk_driver_id, fk_officer_id, fk_violation_id, cition_date, cition_location, cition_status)
	VALUES (1, 1, 1, now(), '2st & main str, Anaheim,CA', 'Active');

INSERT INTO public.tbl_address(
	fk_person_id, address1, address2, city, state, zipcode, phone_number)
	VALUES (1, '123 1st', 'Apt 11', 'Irvine', 'CA', '92801', '714-099-4323');


INSERT INTO public.tbl_address(
	fk_person_id, address1, address2, city, state, zipcode, phone_number)
	VALUES (2, '343 main st', 'Apt A', 'Los Angles', 'CA', '90801', '914-099-4323');


INSERT INTO public.tbl_address(
	fk_person_id, address1, address2, city, state, zipcode, phone_number)
	VALUES (3, '123 1st', 'Apt 11', 'Irvine', 'CA', '92801', '714-099-4323');


INSERT INTO public.tbl_address(
	fk_person_id, address1, address2, city, state, zipcode, phone_number)
	VALUES (4, '1245 123rd st', 'Apt 42', 'Los Angles', 'CA', '90801', '314-099-4323');
