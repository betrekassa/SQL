-- Deployment Instructions. 
-- The assumption is that you are using the supper user “postgres” else you will need to change the user with the one you are currently using who has similar privilege 
-- The ER diagram is for the sake of completion 
1. To create the database either run either option A or B.
	A. go to your directory where you install your PostgreSQL using your command line and type 
		createdb -h localhost -U postgres traffic_violation 
	B. if you already set psql to your environmental variable go to location where you download the assignment files 
		psql -U postgres -f Database_Creation.sql

2. To create the tables for the project 
	A. If you already set psql to your environmental variable 
		psql -U postgres -d traffic_violation -f Schema.sql

3. To insert records to the tables 
	A. If you already set psql to your environmental variable 
		psql -U postgres -d traffic_violation -f Seed.sql

4. To query records from the tables 
	A. If you already set psql to your environmental variable 
		psql -U postgres -d traffic_violation -f Queries.sql
