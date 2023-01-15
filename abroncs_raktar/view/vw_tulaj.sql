CREATE OR REPLACE VIEW vw_tulaj AS 
SELECT t.id,
       t.vezetek_nev,
       t.kereszt_nev,
       t.telefonszam,
       t.email
FROM tulaj t;
