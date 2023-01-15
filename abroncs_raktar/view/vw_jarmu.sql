CREATE OR REPLACE VIEW vw_jarmu AS 
SELECT j.rendszam,
       j.tulaj_id,
       j.jarmu_sulya,
       j.jarmu_max_sebbesege
FROM jarmu j;
