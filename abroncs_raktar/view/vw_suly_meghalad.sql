CREATE OR REPLACE VIEW vw_suly_meghalad AS
SELECT          j.rendszam as Rendszam
               ,t.vezetek_nev || ' ' || t.kereszt_nev as Nev
               ,j.jarmu_sulya
               ,a.terheles_index    
  FROM abroncs a
 INNER JOIN tulaj t
    ON t.id = a.tulaj_id
 INNER JOIN jarmu j
    ON t.id = j.tulaj_id
WHERE a.terheles_index<j.jarmu_sulya;
