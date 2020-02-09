	DO $$	

	--Create a variable 
	DECLARE existsflag BOOL := false;
	BEGIN
		-- Check if table exist 
		existsflag :=  EXISTS (	SELECT 1 
					FROM pg_tables
					WHERE tablename ='tbl_person'
				      ); 
		-- If the table doesn't exist 
		IF existsflag = false THEN 
			CREATE TABLE "tbl_person"
			(
				pk_person_id int,
				first_name varchar,
				last_name varchar,
				gender varchar,
				date_of_birth date
			);
			RAISE NOTICE 'The table person is succesfully created!';
		-- If the table exist the person
		ELSE
			RAISE NOTICE 'The table person already Exists';
		END IF;
		
		--Reset the flag
		existsflag := false;
		
		-- Check if table exist 
		existsflag :=  EXISTS (	SELECT 1 
					FROM pg_tables
					WHERE tablename ='tbl_address'
								); 
								
		-- If the table address doesn't exist 
		IF existsflag = false THEN 
			CREATE TABLE "tbl_address"
			(
				fk_person_id int,
				address1 varchar,
				address2 varchar,
				city varchar,
				state varchar,
				zipcode varchar,
				phone_number varchar
			);
			RAISE NOTICE 'The table address is succesfully created!';
		-- If the table adress exist 
		ELSE
			RAISE NOTICE 'The table address already Exists';
		END IF;


		--Reset the flag
		existsflag := false;
		
		-- Check if table exist 
		existsflag :=  EXISTS (	SELECT 1 
								FROM pg_tables
								WHERE tablename ='tbl_lov_violation'
								); 
								
		-- If the table lov_violation doesn't exist 
		IF existsflag = false THEN 
			CREATE TABLE "tbl_lov_violation"
			(
				pk_violation_id int,
				violation_desc varchar,
				fee_amount numeric(10,2)
			);
			RAISE NOTICE 'The table lov_violation is succesfully created!';
		-- If the table exist the lov_violation
		ELSE
			RAISE NOTICE 'The Table lov_violation already Exists';
		END IF;
		
		
		--Reset the flag
		existsflag := false;
		
		-- Check if table exist 
		 existsflag :=  EXISTS (	SELECT 1 
									FROM pg_tables
									WHERE tablename ='tbl_driver'
								); 
		-- If the table driver doesn't exist 
		IF existsflag = false THEN 
			CREATE TABLE "tbl_driver"
			(
				pk_driver_id int,
				fk_person_id int,
				issued_date date,
				expiration_date date
			);
		RAISE NOTICE 'The Table driver is succesfully created!';
		-- If the table exist the driver
		ELSE
			RAISE NOTICE 'The table driver already Exists';
		END IF;


		--Reset the flag
		existsflag := false;
		
		-- Check if table exist 
		 existsflag :=  EXISTS (SELECT 1 
					FROM pg_tables
					WHERE tablename ='tbl_officer'
								); 
		-- If the table officer doesn't exist 
		IF existsflag = false THEN 
			CREATE TABLE "tbl_officer"
			(
				pk_officer_id int,
				fk_person_id int,
				tittle varchar
			);
		RAISE NOTICE 'The table officer is succesfully created!';
		-- If the table exist the officer
		ELSE
			RAISE NOTICE 'The table officer already exists';
		END IF;



		--Reset the flag
		existsflag := false;
		
		-- Check if table exist 
		 existsflag :=  EXISTS (	SELECT 1 
									FROM pg_tables
									WHERE tablename ='tbl_cition'
								); 
		-- If the table cition doesn't exist 
		IF existsflag = false THEN 
			CREATE TABLE "tbl_cition"
			(
				fk_driver_id int,
				fk_officer_id int,
				fk_violation_id int,
				cition_date	time,
				cition_location varchar,
				cition_status	varchar
			);
		RAISE NOTICE 'The Table cition is succesfully created!';
		-- If the table exist the cition
		ELSE
			RAISE NOTICE 'The Table cition already Exists';
		END IF;

		--Reset the flag
		existsflag := false;
		
		-- Check if table exist 
		 existsflag :=  EXISTS (SELECT 1 
					FROM pg_tables
					WHERE tablename ='tbl_cition_audit'
								); 
		-- If the table cition_audit doesn't exist 
		IF existsflag = false THEN 
			CREATE TABLE "tbl_cition_audit"
			(
				action_type varchar,
				occured_date time,
				made_by varchar,
				fk_driver_id int,
				fk_officer_id int,
				fk_violation_id int,
				cition_date	time,
				cition_location varchar,
				cition_status	varchar
				
			);
		RAISE NOTICE 'The table cition_audit is succesfully created!';
		-- If the table exist the cition
		ELSE
			RAISE NOTICE 'The table cition_aduit already Exists';
		END IF;


	CREATE OR REPLACE FUNCTION process_cition_audit() RETURNS TRIGGER AS $cition_audit$
    BEGIN
        -- If the action is deletion 
		IF (TG_OP = 'DELETE') THEN
            INSERT INTO tbl_cititon_audit SELECT 'Deletion', now(), user, OLD.*;
            RETURN OLD;
        -- If the action is update
		ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO tbl_cition_audit SELECT 'Update', now(), user, NEW.*;
            RETURN NEW;
		-- If the action is insert
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO tbl_cition_audit SELECT 'Insertion', now(), user, NEW.*;
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
	$cition_audit$ LANGUAGE plpgsql;

	DROP TRIGGER IF EXISTS cition_audit ON tbl_cition CASCADE;
	
	CREATE TRIGGER cition_audit
	AFTER INSERT OR UPDATE OR DELETE ON tbl_cition
		FOR EACH ROW EXECUTE PROCEDURE process_cition_audit();
	RAISE NOTICE 'The trigger is created sucessfully on cition table';
	
	END $$;