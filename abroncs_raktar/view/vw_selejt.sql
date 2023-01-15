CREATE OR REPLACE VIEW vw_selejt AS 
SELECT t.vezetek_nev || ' ' || t.kereszt_nev as Nev,
       a.id AbroncsID,
       a.dotszam as Dotszam,
       a.profilmelyseg as Profilmelyseg,
       t.telefonszam as Telefonszam,
       t.email as Email              
FROM abroncs a 
INNER JOIN tulaj t ON a.tulaj_id=t.id 
WHERE (substr(to_char(a.dotszam),-2) < (TO_CHAR( sysdate , 'YY')-6)) OR (a.profilmelyseg < 2);
