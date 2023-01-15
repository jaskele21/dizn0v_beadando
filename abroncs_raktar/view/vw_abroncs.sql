CREATE OR REPLACE VIEW vw_abroncs AS 
SELECT a.id,
       a.tulaj_id,
       a.felni_id,
       a.evszak,
       a.betarolas_ideje,
       a.gyarto,
       a.meret,
       a.profilarany,
       a.atmero,
       a.terheles_index,
       a.sebesseg_index,
       a.profilmelyseg,
       a.dotszam
FROM abroncs a;
