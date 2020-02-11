--Add primary key to person table
ALTER TABLE tbl_person ADD PRIMARY KEY (pk_person_id);

--Add primary key to driver table 
ALTER TABLE tbl_driver ADD PRIMARY KEY (pk_driver_id);

--Add primary key to officer table 
ALTER TABLE tbl_officer ADD PRIMARY KEY (pk_officer_id);

--Add primary key to violation 
ALTER TABLE tbl_lov_violation ADD PRIMARY KEY (pk_violation_id);

--Adds forign key to driver table
ALTER TABLE tbl_driver 
ADD CONSTRAINT person_driver FOREIGN KEY (fk_person_id) REFERENCES tbl_person (pk_person_id);

--Adds forign key to officer table 
ALTER TABLE tbl_officer 
ADD CONSTRAINT person_officer FOREIGN KEY (fk_person_id) REFERENCES tbl_person (pk_person_id);


--Adds forign key to cition table 
ALTER TABLE tbl_cition 
ADD CONSTRAINT violation_cition FOREIGN KEY (fk_violation_id) REFERENCES tbl_lov_violation (pk_violation_id);

ALTER TABLE tbl_cition 
ADD CONSTRAINT driver_cition FOREIGN KEY (fk_driver_id) REFERENCES tbl_driver (pk_driver_id);

ALTER TABLE tbl_cition 
ADD CONSTRAINT officer_cition FOREIGN KEY (fk_violation_id) REFERENCES tbl_officer (pk_officer_id);

--Add forign key to Address table 
ALTER TABLE tbl_address 
ADD CONSTRAINT person_address FOREIGN KEY (fk_person_id) REFERENCES tbl_person (pk_person_id);



