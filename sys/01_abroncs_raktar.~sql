DECLARE
  l_cnt NUMBER;
BEGIN
  SELECT COUNT(*) INTO l_cnt FROM dba_users t WHERE t.username='ABRONCS_RAKTAR';
  IF l_cnt=1 THEN 
    EXECUTE IMMEDIATE 'DROP USER ABRONCS_RAKTAR CASCADE';
  END IF;
END;
/
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
      
