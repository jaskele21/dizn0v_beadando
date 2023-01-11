create user ABRONCS_RAKTAR 
       identified by 12345678
       default tablespace users
       quota unlimited on users
       ; 
       
grant create session to ABRONCS_RAKTAR;
grant create table to ABRONCS_RAKTAR;
grant create view to ABRONCS_RAKTAR;
grant create trigger to ABRONCS_RAKTAR;
grant create sequence to ABRONCS_RAKTAR;
grant create procedure to ABRONCS_RAKTAR;
grant create type to ABRONCS_RAKTAR;
      
